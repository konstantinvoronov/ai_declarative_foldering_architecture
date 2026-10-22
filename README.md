# Flutter AI agent enviroment with rules promoting Declarative Foldering Architecture

## Getting Started

### What is declarative foldering structure in AI

This is a fresh new approach for developing flutter mobile app eighter with big proportion of Ai assiastance or clean Vibe coding.
It contains a set of instruction guiding AI in helping Flutter developers, to use foldering structure as declaration interface of responisbilities, dependecies, and limitation for files located within the folder.
It is also a checking script that mechanically verifyes that ai is not drifing aways and keeps executing basic principales defined in the foldeing architecture.

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
Read lib/AGENTS.md and ai_development/ai_harness.md. Use this project's local skills. We are starting a new application: <describe the idea>. Inspect the inherited blueprint, propose the first minimal working feature, and show the objects, responsibilities, layers, exact paths, and affected files. Run context-checker after drafting the plan and present it for approval.
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
Read lib/AGENTS.md and ai_development/ai_harness.md. Use this project's local skills. Plan adapting Apollo for <describe the application>, including its display name, Dart package, native identifiers, and first feature. Identify the existing examples and reusable foundations to retain. Show proposed objects, roles, layers, paths, and affected files; run context-checker before presenting the plan for approval.
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

### Orientation and architectural design

- [human-developer-helper](.agents/skills/human-developer-helper/SKILL.md) — explain the current stage, useful next step, and why.
- [resolve-declarative-responsibilities](.agents/skills/resolve-declarative-responsibilities/SKILL.md) — resolve proposed objects' roles, names, layers, placement, and both dependency directions before implementation.

### After the initial plan is built

- [context-checker](.agents/skills/context-checker/SKILL.md) — verify the plan uses sufficient, relevant context and correctly interprets applicable instructions.
- [task-decomposer](.agents/skills/task-decomposer/SKILL.md) — review whether work should be split into smaller independent tasks; its current audit inputs are working-tree, staged, or committed changes. Use that evidence when available and distinguish planning recommendations from a completed change-set audit.

### When implementation is complete

Run [finalize-job](.agents/skills/finalize-job/SKILL.md). Its workflow automatically includes these project-local checks when the agent executes the skill:

- [pattern-keeper](.agents/skills/pattern-keeper/SKILL.md) — review the job against applicable implementation patterns and request corrections.
- [check-naming](.agents/skills/check-naming/SKILL.md) — verify names express established architectural roles.
- [check-declarative-rules](.agents/skills/check-declarative-rules/SKILL.md) — verify architectural declarations, dependency permissions, and approvals.
- [check-responsibility-leaks](.agents/skills/check-responsibility-leaks/SKILL.md) — compare actual behavior and dependencies with declared responsibilities.
- [task-decomposer](.agents/skills/task-decomposer/SKILL.md) — check the final change set for independent concerns requiring separation.
- [update-diagnostic-spec](.agents/skills/update-diagnostic-spec/SKILL.md) — audit affected features' diagnostic specifications; update mode is available during separately authorized diagnostics work.
- [violation](.agents/skills/violation/SKILL.md) — collect remaining developer-declared violations from the conversation before the final audits.

Finalization also checks verification evidence, feature documentation, protected files, and commit state. Invocation is an agent workflow requirement; evidence of execution establishes which checks actually ran.

### Understand changes and review code

- [update-by-layer](.agents/skills/update-by-layer/SKILL.md) — explain changes by architectural layer and responsibility, naming objects, files, and generated updates.
- [violation](.agents/skills/violation/SKILL.md) — record review findings declared by the developer, their cause, offending code, and confirmed intended correction.

### Investigate an existing violation

- [investigate-discovered-violation](.agents/skills/investigate-discovered-violation/SKILL.md) — explicitly reopen a discovered legacy-code or technical-debt finding for investigation, trace its evidenced causes and related occurrences, and propose remediation for approval. This is separate from recording a violation and can start outside an active task. It coordinates context, responsibility resolution, architecture, naming, and pattern reviews; approved corrections proceed through finalization and an update by layer. Historical evidence and current requirements are distinguished.

### Update Apollo Declarative in a derived project

- [update-framework-harness](.agents/skills/update-framework-harness/SKILL.md) — compare the project's recorded Apollo Declarative commit with latest upstream master, explain architectural harness changes with affected files, and offer adoption of all updates, selected improvements, or project-specific adaptations.

The project's [framework version](ai_development/apollo_declarative_version.json) is one upstream commit. After the developer's final decision and completion of selected changes, it advances to the commit inspected by that session, including when all updates are declined. The next session starts from that marker. A separate [update history](ai_development/apollo_declarative_update_history.md) explains completed sessions.

These tracking files remain project-owned. The skill uses the shared manifest to scope harness updates and preserves application source, local patterns, and violation history. Existing protected-file approvals remain active. Version tracking starts from the recorded baseline; the initial history entry explains how it was established.

### Periodic developer-led maintenance

- [maintain-ai-harness](.agents/skills/maintain-ai-harness/SKILL.md) — review harness consistency and performance using recent violations; help the developer resolve them and apply approved pattern or instruction updates.

Project-wide patterns live in [ai_development/patterns.md](ai_development/patterns.md). Folder catalogs add scoped rules and specific overrides. Follow the [AI harness](ai_development/ai_harness.md) for execution, approvals, and synchronization, and the [foldering contract](ai_development/declarative_foldering_rules.md) for architecture.

###

As an evangelist for declarative patterns—especially in Flutter—I’m introducing a way to organize and layer your projects so the AI can easily follow along. That means you get a human-friendly, declarative roadmap right from the start.



## Pain it is supposed to solve

One of the main problems I'm trying to solve with this declarative architecture repository is how large language models (LLMs) are trained. Typically, LLMs build their expertise on a huge amount of Stack Overflow answers and GitHub examples, but these are often small snippets or simple sample projects. That means the AI is really good at handling smaller, less sophisticated tasks because they don't require complex architecture. But when it comes to bigger, more complicated, production-ready projects, the AI can struggle unless it’s given a more precise and structured set of instructions.

So the goal here is to take that small-piece expertise that the LLM already has and shape it into something more suitable for bigger, declarative, and complex architectures. In other words, we're giving the AI a more detailed, declarative framework so it can handle larger-scale, production-level projects more effectively.


## What can you expect in the repo? 

It’s essentially a ready-made folder structure along with a set of instructions that guide both the AI (and human developers) on how to handle responsibilities between layers, manage dependencies, and keep everything interconnected in a clear, declarative way. Plus, there’s a built-in linter that will analyze changes and help both you and the AI keep things human-readable and dependable.


In this repository, I’m diving into my passion for declarative development patterns in Flutter. While I’m enthusiastic about sharing these ideas, I also see this as an experiment and a work in progress. I’m here to learn and refine these concepts along the way, and I welcome any feedback from the community as we grow this together. This project is all about exploring and making declarative patterns accessible in a supportive and collaborative way.

## And beyond just guiding the AI, 

this repository is designed for “vibe coders”—developers who want a clear, step-by-step structure for planning, implementing, and reviewing their code. It’s about helping the AI guide the human developer through a well-structured process so that even larger, more complex projects feel manageable. By answering the AI’s questions and following the prompts, developers can keep their workflow organized and aligned with best practices, ultimately making the whole development experience smoother and more scalable.



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
