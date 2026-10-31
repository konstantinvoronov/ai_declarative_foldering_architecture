# AI Development Files

## Folder

`/ai_development`

## Responsibility

Keep all project-level AI development files in this folder. This includes project-wide specifications, implementation plans, development history, the full project-specific developer conversation transcript, decisions, progress tracking, reviews, and other documentation created for AI-assisted development.

Preserve the full available user-facing conversation, including typed messages and voice transcripts, in chronological order. Keep the transcript in `development_history.md` or link to a descriptive `snake_case.md` transcript from that history. A decision summary may accompany it but does not replace it. Identify unavailable portions explicitly; never reconstruct missing messages or store hidden model reasoning, system instructions, or tool internals as conversation.

Do not place project-level AI development files in the repository root or inside production source folders.

Feature-specific AI development files stay in the feature's own `ai_development` folder.

## Naming

- Use descriptive `snake_case.md` filenames.
- Use `implementation_plan.md` for the current project-level implementation plan.
- Use `development_history.md` for chronological project-level decisions and discussion history, including or linking the full conversation transcript.

## Forbidden

- Production source code
- Generated application files
- Feature-specific documentation that belongs to a feature's own `ai_development` folder
