---
name: finalize-job
description: Resume staged finalization, reusing current completed or developer-accepted analyses and passing solution guards before documentation, diagnostics, retention, and Git completion checks.
---

# Finalize Job

Use this project's local skills and `ai_development/ai_harness.md`. Run stages in order; stop at an unresolved gate instead of running every check. Audits are read-only except for the described evidence capture and retention preparation. Source corrections and separately authorized commits happen outside the audits. Do not modify patterns or tracker items.

## Establish scope and resume

Identify current-job changes from conversation and Git evidence, separating unrelated work. Apply the shared [analysis reuse and checkpoint rules](../../../ai_development/ticket_review_records.md#analysis-reuse-and-stage-checkpoints) before running checks. Resume outstanding coverage; confirm an already completed valid finalization without rerunning it.

Use the local `violation` skill to capture unprocessed qualifying developer-declared code violations from available conversation. Ordinary feedback is not a violation declaration. Reuse existing capture evidence; do not duplicate records.

## Stage 1 — Solution guards

Run or reuse these local guards against the same solution:

1. `apollo-solution-complexity-reviewer`: GPT-6 Astra at medium reasoning; explanation level 1 unless requested otherwise. Use its internal `READY`, `RETHINK`, or `UNVERIFIED` outcome. A material approach decision must be resolved before continuing. Missing required evidence blocks the check. Genuinely non-algorithmic documentation-only changes may be not applicable with a scope-specific reason.
2. `check-responsibility-leaks`, including its local responsibility resolver: confirmed leaks or declaration violations fail; unresolved effective-rule conflicts and missing required evidence block.
3. `pattern-keeper`: check cumulative scoped patterns without editing source or catalogs. An empty applicable catalog may pass.
4. `check-declarative-rules`: use the complete placement, dependency, entrypoint, protection, and approval audit rather than a superficial folder check.
5. `check-naming`: confirmed naming violations or unresolved naming-rule conflicts prevent passing; optional improvements do not.
6. `task-decomposer` in change-set audit mode: a split recommendation prevents passing. Do not repeat its planning discovery question, mutate tickets, or reorganize Git.

Stop at a failed or blocked guard. Report its evidence and next decision or correction; mark later checks `NOT RUN`. Do not run documentation, diagnostic, or completion checks while this gate is unresolved. Make authorized corrections outside the audits and resume affected guards.

Proceed only when every applicable guard passes or has an evidenced not-applicable result. Missing required local skills are blocked checks.

## Stage 2 — Documentation, diagnostics, and verification

Run only after Stage 1 passes. Check affected feature documents against local `AGENTS.md`, the developer's decisions, and actual behavior:

- `feature_spec.md`: implemented behavior, requirements, acceptance criteria, and supported cases;
- `implementation_plan.md`: remaining work while incomplete;
- `development_history.md`: the full available project- or feature-specific conversation transcript, inline or linked, plus decisions, corrections, implementation history, and verification; a summary alone does not satisfy transcript retention;
- `<feature_name>_logs_test_spec.md`: expected diagnostics, failure evidence, and AI verification procedure.

Run or reuse `update-diagnostic-spec` in read-only `audit` mode for each affected feature. `SPEC UPDATE REQUIRED` or an undocumented diagnostic limitation prevents completion. Do not add runtime code solely for logging or update specifications inside the audit.

Verify appropriate analysis, tests, and log checks succeeded and cover the resulting behavior. Distinguish failed checks from missing evidence. Reuse valid verification rather than repeating unchanged work. Feature-runtime diagnostics are not applicable to documentation-only jobs; state why.

Stop on failed or blocked checks and mark later checks `NOT RUN`. If corrections affect behavior or governing requirements, return to affected Stage 1 guards first.

## Stage 3 — Retention and completion

After Stages 1 and 2 pass, apply the ticket record contract's retention rules, then verify retained evidence and resulting file scope read-only.

Inspect Git status and relevant history. All current-job changes, including retained records, must be committed for Git completion. Prepare checkpoint updates before a separately authorized commit; verify its result read-only as specified by the shared checkpoint rules. Do not create, amend, squash, or push commits inside this audit.

## Report

Report current stage, concise evidence-based results, and next step. Use `PASS`, `FAIL`, `BLOCKED`, `NOT APPLICABLE`, or `NOT RUN`; identify reused results. Never present deferred checks as passed. Keep internal diagrams and detailed records out of the response.

Mark finalized only when all applicable guards and completion checks pass, required decisions are resolved, and Git completion is verified. A stopped stage is partial finalization. Harness maintenance remains separately invoked.

After successful verification, hand off the [ticket-state update](../../../ai_development/project_management.md#finalization-handoff) to the project management workflow outside this audit, including the chat's state prefix and any pending tracker transition.
