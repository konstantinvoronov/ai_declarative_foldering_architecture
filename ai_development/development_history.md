# Development History

## 2026-10-31 — Solution complexity review and ticket context lifecycle

The developer requested Apollo Solution Complexity Reviewer and connections across task decomposition, context checking, related-ticket discovery, and finalization.

The review reconstructs the implemented algorithm into an internal sequence diagram and challenges both long interaction chains and unnecessary models, classes, and wrappers. The target is simpler responsibility-contained behavior with fewer concepts where justified. Complexity is evidence to investigate rather than proof of a defect; an assessment may find no supported simplification. Alternatives must preserve required behavior and architectural boundaries.

The chosen reviewer is GPT-6 Astra with medium reasoning, in a separate review context supplied with requirements, constraints, code evidence, and the diagram. It treats existing justifications as claims to verify. The response reports actual reviewer settings and uses explanation levels 1–10 as compression controls, without padding, unsolicited questions, or a tradeoff discussion. Confidence has one concise supporting reason.

Review evidence is reusable across explanation levels and is tied to relevant code, requirements, and constraint fingerprints. Records preserve diagrams, evidence, conclusions, concise rationale, and decisions rather than private chain-of-thought. Useful records belong under unambiguous ticket identifiers so reopened and connected tickets can reuse them.

Task decomposition now supports planning and asks once whether to investigate related issues or milestones. Discovery returns evidence; the decomposer decides relevance and prepares or applies authorized active-ticket updates. Context checking examines relevant related-ticket evidence and retained reviews while distinguishing historical claims from current verification. Finalization retains useful issue records and cleans only inventoried, current-job-owned temporary files before final read-only verification. Audit-only requests remain read-only.

Updated the project-local skills, discovery metadata, workflow documentation, and explicit synchronization manifest. Actual issue records remain project-owned and excluded from shared synchronization. No sibling checkout, application source, AGENTS guide, tracker item, or existing review artifact was changed.

Verification: all five new or updated workflow skills pass the skill validator; changed-document links and headings and manifest path existence/uniqueness pass; `git diff --check` passes. A separate read-only scenario walkthrough covered repeated explanation levels, dirty collaborators, reopened related issues, mixed temporary-file ownership, unanswered discovery choices, and unavailable reviewers. It identified a planning/audit ambiguity in the decomposer; the instructions were corrected so unimplemented plans do not require a diff or recovery operations. These checks validate instruction consistency, not live tracker integration or production review quality.

The developer subsequently requested verification against the agreed scope and a commit. Scope review found no material drift: the changes implement the requested review and connected-ticket lifecycle. Declarative placement and documentation naming pass against the AI development guide; skill names and metadata match their responsibilities. Responsibility review confirms discovery gathers evidence, decomposition decides relevance, context checking audits coverage, and finalization handles retention before read-only verification. Pattern supervision found no applicable implementation patterns in the blueprint's empty catalog. The change is one coherent project-level harness workflow; no task split is required. No developer-declared code violation requiring capture was found in the available discussion. Feature specifications, runtime diagnostics, and device-log checks do not apply to this documentation-only job. No temporary review artifacts need cleanup. The unrelated pre-existing branding skill is excluded from the requested commit. Git completion is verified after the separately authorized commit.

## 2026-10-31 — Staged finalization and shared analysis reuse

The developer requested solution complexity, responsibility, pattern, and declarative architecture guards before documentation, logging, and completion checks. Naming and task-scope guards remain in the first stage. A failed or blocked guard stops later checks. The complexity reviewer supplies an internal READY, RETHINK, or UNVERIFIED outcome; evidence-backed developer decisions can resolve approach questions without waiving confirmed architectural violations.

The developer clarified that every analyzer, including the context checker, should first look for current completed or developer-accepted results and avoid repeating an already satisfactory run. Shared analysis checkpoints now capture scope, verifiable input revisions, evidence, decisions, stage, and next step. Only missing or invalidated coverage is rerun, unless a fresh assessment is explicitly requested. Context checks additionally account for task stage and available/consulted sources. Existing accepted failures or unresolved findings are preserved rather than rerun to obtain a pass. Updated the analyzer entrypoints, finalizer, complexity-review gate, shared record contract, and workflow documentation. This supersedes the earlier optional-at-finalization integration. No source or AGENTS guide changed.

Further clarification: eligible stages continue automatically toward the authorized chat goal unless a skill or finding requires developer attention. User messages and manual work do not trigger a restart. Resume from checkpoints, reconcile actual changes or evidenced manually completed checks, and preserve prior decisions and approvals.

## 2026-10-31 — Full transcript retention

The developer explicitly required full transcript retention for project-level work as well as feature work. Updated the project AI development guide and finalization check. The [full available conversation transcript](solution_complexity_conversation_transcript.md) preserves typed messages and recorded voice segments; this decision summary does not replace it. The developer deferred GitHub authorization and the follow-up commit until later.

The developer then requested precise, concise usage guidance in both README and human-developer-helper. Both now explain invoking the complexity reviewer, its Astra medium setting and compression levels, planning with related-ticket context, staged finalization, reuse after interaction or manual work, and full transcript retention. These additions explain existing behavior rather than adding new workflow gates.

## 2026-10-31 — Consolidate repeated guidance

The developer requested removal of unnecessary wording while keeping behavior defined by the harness rather than model defaults. Replaced repeated analyzer reuse paragraphs with links to the shared contract, consolidated checkpoint and invalidation rules, and shortened README, human-helper, finalizer, and harness descriptions. Preserved staged gates, automatic continuation and resumption, developer decisions, evidence requirements, ticket retention, transcript retention, and concise usage guidance. Eleven skill validators, document links/anchors/headings, and whitespace checks pass. Changes remain uncommitted at the developer's request.

## 2026-10-31 — Apollo Declarative project management entrypoints

Implemented the agreed initial setup and tracked-work workflow: four focused skills, a root agent entrypoint, shared project-owned setup/state conventions, README onboarding, and synchronization entries. Added the post-finalization ticket-state handoff and maintenance completion recording. Existing skill names and the separate earlier chat's pending changes remain outside this job.

The [full available conversation](project_management_conversation_transcript.md) preserves typed and voice discussion, corrections, approvals, and the later commit request. The spoken claim that a commit had already happened was corrected: the actual chat was renamed to Pending finalization, and the developer subsequently requested the commit explicitly.

[Finalization evidence](review_work/project_management_setup/analysis_checkpoint.md) records the scoped guards, structural validation, synchronization preview, and verification limits. This documentation-only job changes instructions rather than application runtime behavior. Store registrations, stars/subscriptions, dashboard provisioning, and live connector workflows were described rather than executed. Tracker association remains unassigned; the earlier chat retains its own pending issue work.

## 2026-10-31 — Ticket association and commit

After the developer explicitly authorized the embedded browser, created [GitHub issue #1](https://github.com/konstantinvoronov/ai_declarative_foldering_architecture/issues/1), Track Apollo skill workflow updates. Associated the staged follow-up with this issue for the authorized commit. Existing validation evidence is reused; final commit state is verified read-only. The unrelated branding skill remains excluded.

## 2026-11-01 — Derived-app Firebase setup and explicit reviewer selection

The developer required Firebase/APNs configuration to belong to each derived application's setup because Apollo is a framework. The exact approved setup amendment adds iOS/Android project/app selection, native configuration/resource verification, APNs/signing progress, registration ownership and per-platform verification records. Unavailable backend storage/sending remains pending. The setup skill and supporting conventions were published to Apollo; no specific Firebase project was configured for the framework.

During finalization, the developer explicitly supplied the existing complexity-review skill and approved the exact finalizer amendment accepting that selected definition while preserving the reviewed project's architecture/pattern authority. A separate Astra medium review returned READY for the notification approach. The developer then accepted separate finalization scopes for runtime notifications, setup workflow and the finalizer correction. The unrelated pre-existing branding skill remains excluded.

The [full available conversation transcript](notifications_conversation_transcript.md) retains typed and voice dialogue and the approval responses. Skill/schema/synchronization checks passed in their recorded scopes; live setup against a derived app was not executed. Full finalization and Git completion remain pending their respective gates.

## 2026-11-01 — Approval scope correction

The developer clarified “it should any Agents.md file” and then requested “lets update this rule.” Updated only the approval sentence in lib/AGENTS.md so it governs AGENTS.md files rather than every Markdown file. Existing task authorization covers ordinary specification, history and diagnostic Markdown. The full conversation transcript retains the clarification and source-specific approval. The earlier generic Xcode/CocoaPods gate was a tooling-skill detour; Apollo retains its established Flutter/CocoaPods workflow.

The agent subsequently displayed the complete revised AGENTS.md approval sentence and the developer replied “aprove,” explicitly confirming that exact wording. It was retained without further guide modification.
