# CLAUDE.md

Keep this file short. Facts and standing rules belong here; procedures belong in a
skill. If a section grows into a step-by-step process, move it out.

Revise this file every time Claude does something you didn't want. That is the whole
maintenance protocol.

---

## Identity

<!-- TODO: one paragraph. What the agency does, the niche, the ICP, the positioning. -->

We build conversion-focused websites, configured CRM systems and automations for
[NICHE] businesses in [GEOGRAPHY]. One operator. The reusable asset is the skills
library, not the client list.

Three service levels:
- **L1** — website rebuild. Entry product, first dollar, proof.
- **L2** — CRM setup + the four core automations, on a monthly retainer.
- **L3** — 5–25 automations behind one client dashboard.

## Voice

<!-- TODO: paste two real examples of how you actually write to a prospect. -->

Plain, specific, short. Name the number. No hype adjectives, no "revolutionary", no
"leverage", no exclamation marks. Say what the thing does, not what category it's in.
Never write "AI-powered" in client-facing copy — clients buy outcomes, not the method.

## Commercial

- Every client gets roughly 5× back what they pay. Make the value visible before
  naming a price.
- Never quote a price before a call.
- One number, not a menu. Tool costs are bundled into the price.
- Payment upfront, always, before work starts. Retainers auto-charge monthly in
  advance.
- <!-- TODO: current pricing per level -->

## Delivery standards

"Done" means it passed `/site-qa-checklist` with no failures. Specifically:
- Forms tested end-to-end into the CRM, with the follow-up automation observed firing
- WCAG 2.1 AA as a floor, not an aspiration
- Lighthouse performance 90+
- Analytics and call tracking verified firing live
- Privacy policy and cookie consent on every site shipped

Delivery hours per site must trend down every month. If they don't, a skill is missing.

## Non-negotiables

- **Plan mode before building.** Ask clarifying questions before assuming anything.
- **Never hardcode secrets.** Env vars only. `.env` is gitignored and stays that way.
- **Auth on every public endpoint.** Rate limits and hard cost caps on every API key.
- **Never deploy a prospect rebuild publicly.** Unlisted or password-protected only.
  Never use their photography. Blur name and logo in anything posted.
- **Never draft cold outreach without confirming the jurisdiction's rules first.**
  Never cold SMS.
- **Get consent before recording any call.**
- Pull current library docs (context7) before writing code against any API. Do not rely
  on memory for API surfaces.
- Client personal data never enters this repo. Lists live in the sending tool, contacts
  live in the CRM.

## Map

```
skills/<department>/<skill-name>/SKILL.md   source of truth; symlinked to ~/.claude/skills/
clients/<client-name>/                      context.md, spec.md, transcripts/
templates/                                  site templates, contracts, proposals
content/                                    proof posts, Loom scripts, screenshots
admin/metrics.md                            the weekly numbers
admin/decisions.md                          why we chose what we chose
```

Naming: kebab-case everywhere. Client folders use the trading name, lowercased.
Run `./install-skills.sh` after adding or renaming any skill.

## Standing behaviour

- Ask before creating files outside the structure above.
- When you build something for the second time, say so and offer to turn it into a
  skill.
- Prefer editing an existing skill over writing a new one.
