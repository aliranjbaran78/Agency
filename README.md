# Agency

/your-agency
├── CLAUDE.md              (who you are, what the business does, how to behave)
├── skills/
│   ├── engineering/       (superpowers, context7, mcp-builder, webapp-testing)
│   ├── design/            (frontend-design, taste, brand-guidelines)
│   ├── sales/             (proposal-writer, campaign-builder, call-prep)
│   ├── delivery/          (build-premium-website, mini-automation, new-client-system)
│   └── operations/        (invoicing, onboarding, reporting)
├── clients/
│   └── [one folder per client: context, transcripts, builds]
├── templates/
│   └── [website templates, contract template, proposal skeleton]
└── content/
    └── [proof posts, looms, screenshots for marketing]


The business style plan 
runner API key      (from the automation platform)
auth broker key     (from the OAuth service)
Anthropic API key   (for AI-generated email text)
Drive folder ID     (from the folder URL)
business details    (logo URL, bank details, currency, net terms)

### Tools

front end    Next.js + Tailwind + shadcn components
auth         magic links via email, no passwords,
             restricted to the client's email domain
back end     code-based automation runner (open source)
database     MongoDB (built-in vector search for RAG)
hosting      Vercel (front) + runner cloud (back),
             or the client's own servers for enterprise
