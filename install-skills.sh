#!/usr/bin/env bash
# Symlink every skill in skills/<department>/<skill-name>/ into ~/.claude/skills/
# so they are available in every project, not just this repo.
# Re-run after adding, renaming or removing a skill.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_ROOT/skills"
DEST="$HOME/.claude/skills"

if [[ ! -d "$SRC" ]]; then
  echo "No skills/ directory at $SRC" >&2
  exit 1
fi

mkdir -p "$DEST"

linked=0
skipped=0
pruned=0

# Remove stale symlinks that point back into this repo but no longer exist
for link in "$DEST"/*; do
  [[ -L "$link" ]] || continue
  target="$(readlink "$link")"
  case "$target" in
    "$SRC"/*)
      if [[ ! -d "$target" ]]; then
        rm "$link"
        echo "pruned   $(basename "$link")"
        pruned=$((pruned + 1))
      fi
      ;;
  esac
done

# skills/<department>/<skill-name>/SKILL.md
for skill_dir in "$SRC"/*/*/; do
  [[ -d "$skill_dir" ]] || continue
  skill_dir="${skill_dir%/}"
  name="$(basename "$skill_dir")"

  if [[ ! -f "$skill_dir/SKILL.md" ]]; then
    echo "SKIP     $name  (no SKILL.md)"
    skipped=$((skipped + 1))
    continue
  fi

  target="$DEST/$name"

  if [[ -L "$target" ]]; then
    existing="$(readlink "$target")"
    if [[ "$existing" == "$skill_dir" ]]; then
      echo "ok       $name"
      continue
    fi
    echo "RELINK   $name  (was -> $existing)"
    rm "$target"
  elif [[ -e "$target" ]]; then
    echo "CONFLICT $name  (real directory already at $target — not touching it)" >&2
    skipped=$((skipped + 1))
    continue
  fi

  ln -s "$skill_dir" "$target"
  echo "linked   $name"
  linked=$((linked + 1))
done

echo
echo "linked: $linked  skipped: $skipped  pruned: $pruned"
echo "Ask Claude Code 'what skills are available?' to confirm, or run /doctor."
