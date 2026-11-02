# Apollo Declarative

Architecture and a project-local AI development harness for human-in-the-loop Flutter development.

Apollo Declarative gives developers and coding agents a shared way to decide where code belongs, what it may depend on, and how a change should be reviewed. This repository provides the architecture blueprint and reusable harness; [Apollo's working scaffold](https://github.com/konstantinvoronov/apollo-declarative) applies them in a Flutter application. The workflow guides the developer and agent from discussing a change and resolving architectural responsibilities through planning, implementation, and review.

The developer directs requirements, architectural decisions, and approvals; the coding agent assists with investigation, planning, implementation, and verification. This **human-in-the-loop development** workflow keeps decisions and review evidence available for the developer to inspect and refine.

Its architectural foundation, **Declarative Foldering**, uses folders and scoped instructions to declare object responsibilities, dependency boundaries, and entrypoints. Project-local skills help the agent apply those declarations throughout the development process.

Apollo applies **harness engineering** through repository instructions, reusable skills, and staged reviews. Its **context engineering** centers on applicable architecture rules, task context, and recorded decisions, with [context-checker](.agents/skills/context-checker/SKILL.md) auditing relevance and coverage.

## Getting Started

### Start a project from Git

Choose the architecture blueprint for a rules-first project or [Apollo Declarative](https://github.com/konstantinvoronov/apollo-declarative) for a working Flutter scaffold. Use a published revision containing the linked harness and skills below.

#### Scenario 1: Start with the architecture blueprint

```sh
git clone https://github.com/konstantinvoronov/ai_declarative_foldering_architecture.git my-app
cd my-app
git remote rename origin architecture
git remote add origin https://github.com/YOUR_ACCOUNT/YOUR_REPOSITORY.git
git switch -c project-start
```

Create an empty destination repository first. These commands preserve the starting history and keep the blueprint as a reference remote. Push the approved project baseline with `git push -u origin project-start` when ready.

Open the checkout in your AI coding tool and start with:

```text
Read AGENTS.md, lib/AGENTS.md, and ai_development/ai_harness.md. Use this project's local skills. We are starting a new application: <describe the idea>. Complete applicable application setup, then inspect the inherited blueprint, propose the first minimal working feature, and show the objects, responsibilities, layers, exact paths, and affected files. Run context-checker after drafting the plan and present it for approval.
```

Expected next step: approve a small implementation plan and the necessary project identity changes.

#### Scenario 2: Start with Apollo's working scaffold

```sh
git clone https://github.com/konstantinvoronov/apollo-declarative.git my-app
cd my-app
git remote rename origin apollo
git remote add origin https://github.com/YOUR_ACCOUNT/YOUR_REPOSITORY.git
git switch -c project-start
flutter pub get
flutter run
```

Use an empty destination repository. Push the approved baseline with `git push -u origin project-start` when ready. Apollo carries its own rules and skills; the architecture checkout is optional.

First prompt:

```text
Read AGENTS.md, lib/AGENTS.md, and ai_development/ai_harness.md. Use this project's local skills. Complete applicable application setup, then plan adapting Apollo for <describe the application>, including its display name, Dart package, native identifiers, and first feature. Identify the existing examples and reusable foundations to retain. Show proposed objects, roles, layers, paths, and affected files; run context-checker before presenting the plan for approval.
```

Expected next step: approve the identity and first-feature adaptation before implementation.

#### Scenario 3: Adopt the harness in an existing project

Clone this blueprint beside the existing checkout, then preview synchronization from the blueprint directory:

```sh
python3 ai_development/sync_harness.py --source . --target /absolute/path/to/existing-project
```

First prompt:

```text
Review this synchronization preview and compare the blueprint with the existing project's instructions and architecture. Propose a scoped adoption plan, preserving project-specific patterns, violation history, and source. Identify conflicts and exact instruction files requiring approval. Run context-checker on the plan and ask for approval before applying it.
```

Expected next step: review conflicts and approve selected harness changes. Apply the reviewed synchronization with the same command plus `--apply`; approve each affected AGENTS.md separately. The manifest controls shared files and sections; project-owned patterns and history stay local.

## AI skills by workflow stage

Skill names below link to the project-local definitions. Invoke them using `$skill-name` in a compatible AI tool. The agent performs the checks described by the skills and reports evidence.

### Application setup and project management

The [root agent guide](AGENTS.md) detects incomplete setup in derived projects that retain Apollo's default identity. [Setup](.agents/skills/setup-apollo-declarative/SKILL.md) collects the app name and IDs, offers registration and icon chats, establishes the chosen project management system, and offers upstream repository follow-ups. GitHub with GitHub Projects is recommended; dashboard support adapts to the connected plugin. Confirmed choices and completion status belong to the project's `ai_development/project_setup.json`.

- [triage-apollo-declarative](.agents/skills/triage-apollo-declarative/SKILL.md) connects requested changes to tracked work and reuses development skills for context and planning.
- [decompose-project-apollo-declarative](.agents/skills/decompose-project-apollo-declarative/SKILL.md) assesses milestones for useful issues or smaller milestones.
- [create-icon-apollo-declarative](.agents/skills/create-icon-apollo-declarative/SKILL.md) is the initial placeholder for a separate app-icon chat.

[Shared conventions](ai_development/project_management.md) define setup records, `[State] Item title` chat names, adaptive tracker states, the post-finalization handoff, and weekly maintenance suggestions.

### Orientation and architectural design

- [human-developer-helper](.agents/skills/human-developer-helper/SKILL.md) — explain the current stage, useful next step, and why.
- [resolve-declarative-responsibilities](.agents/skills/resolve-declarative-responsibilities/SKILL.md) — resolve proposed objects' roles, names, layers, placement, and both dependency directions before implementation.

### After the initial plan is built

- [context-checker](.agents/skills/context-checker/SKILL.md) — verify the plan uses sufficient, relevant context and correctly interprets applicable instructions.
- [task-decomposer](.agents/skills/task-decomposer/SKILL.md) — plan coherent tasks or review working-tree, staged, or committed changes; offer related-ticket discovery during planning and evaluate useful context.
- [discover-related-tickets](.agents/skills/discover-related-tickets/SKILL.md) — find evidenced related issues and milestones for the decomposer without changing the tracker.

### When implementation is complete

Run [finalize-job](.agents/skills/finalize-job/SKILL.md). It first resolves solution guards, then checks documentation, diagnostics, and verification, and finally handles retention and Git completion. Failed or blocked guards stop later checks. Every analyzer, including context checking, reuses current completed or evidenced developer-accepted results rather than repeating unchanged analysis. Its solution guards are:

- [apollo-solution-complexity-reviewer](.agents/skills/apollo-solution-complexity-reviewer/SKILL.md) — review the solution approach with Astra medium, reusing a valid saved assessment.
- [pattern-keeper](.agents/skills/pattern-keeper/SKILL.md) — review the job against applicable implementation patterns and request corrections.
- [check-naming](.agents/skills/check-naming/SKILL.md) — verify names express established architectural roles.
- [check-declarative-rules](.agents/skills/check-declarative-rules/SKILL.md) — verify architectural declarations, dependency permissions, and approvals.
- [check-responsibility-leaks](.agents/skills/check-responsibility-leaks/SKILL.md) — compare actual behavior and dependencies with declared responsibilities.
- [task-decomposer](.agents/skills/task-decomposer/SKILL.md) — check the final change set for independent concerns requiring separation.

After the guards pass, [update-diagnostic-spec](.agents/skills/update-diagnostic-spec/SKILL.md) audits affected features' diagnostic specifications alongside documentation and verification checks. Update mode belongs to separately authorized diagnostics work.

Preparation uses [violation](.agents/skills/violation/SKILL.md) to collect qualifying developer-declared violations before the audits.

Finalization also checks verification evidence, feature documentation, protected files, retained ticket-review evidence, owned temporary-artifact cleanup, and commit state. Retention and cleanup happen before final read-only verification; audit-only requests report proposed changes. Invocation is an agent workflow requirement; evidence of execution establishes which checks actually ran.

### Understand changes and review code

- [apollo-solution-complexity-reviewer](.agents/skills/apollo-solution-complexity-reviewer/SKILL.md) — review algorithm sequences and conceptual complexity with Astra medium, save ticket-linked evidence, and explain concisely at levels 1–10 without repeating valid reviews.
- [Ticket review records](ai_development/ticket_review_records.md) — shared storage, freshness, related-issue context, and retention conventions for these skills. Actual records stay project-owned.
- [update-by-layer](.agents/skills/update-by-layer/SKILL.md) — explain changes by architectural layer and responsibility, naming objects, files, and generated updates.
- [violation](.agents/skills/violation/SKILL.md) — record review findings declared by the developer, their cause, offending code, and confirmed intended correction.

Use `$apollo-solution-complexity-reviewer level 3` after implementation. Astra medium reviews interaction chains and unnecessary concepts using an internal diagram, then explains the approach and confidence with a concise reason. Levels 1–10 control compression, not review effort; changing levels reuses valid evidence. The skill does not edit application code. See [reuse and retention rules](ai_development/ticket_review_records.md) for saved reviews and resumption.

### Investigate an existing violation

- [investigate-discovered-violation](.agents/skills/investigate-discovered-violation/SKILL.md) — explicitly reopen a discovered legacy-code or technical-debt finding for investigation, trace its evidenced causes and related occurrences, and propose remediation for approval. This is separate from recording a violation and can start outside an active task. It coordinates context, responsibility resolution, architecture, naming, and pattern reviews; approved corrections proceed through finalization and an update by layer. Historical evidence and current requirements are distinguished.

### Update Apollo Declarative in a derived project

- [update-framework-harness](.agents/skills/update-framework-harness/SKILL.md) — compare the project's recorded Apollo Declarative commit with latest upstream master, explain architectural harness changes with affected files, and offer adoption of all updates, selected improvements, or project-specific adaptations.

The project's [framework version](ai_development/apollo_declarative_version.json) is one upstream commit. After the developer's final decision and completion of selected changes, it advances to the commit inspected by that session, including when all updates are declined. The next session starts from that marker. A separate [update history](ai_development/apollo_declarative_update_history.md) explains completed sessions.

These tracking files remain project-owned. The skill uses the shared manifest to scope harness updates and preserves application source, local patterns, and violation history. Existing protected-file approvals remain active. Version tracking starts from the recorded baseline; the initial history entry explains how it was established.

### Periodic developer-led maintenance

- [maintain-ai-harness](.agents/skills/maintain-ai-harness/SKILL.md) — review harness consistency and performance using recent violations; help the developer resolve them and apply approved pattern or instruction updates.

Project-wide patterns live in [ai_development/patterns.md](ai_development/patterns.md). Folder catalogs add scoped rules and specific overrides. Follow the [AI harness](ai_development/ai_harness.md) for execution, approvals, and synchronization, and the [foldering contract](ai_development/declarative_foldering_rules.md) for architecture.

## Project status

Apollo Declarative is an evolving architecture and development-workflow project. Feedback from developers using coding agents on Flutter applications helps refine its folder contracts, skills, and review process. Community feedback and contributions are welcome.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
