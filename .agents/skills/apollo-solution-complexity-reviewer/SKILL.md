---
name: apollo-solution-complexity-reviewer
description: Explain an implemented solution's architecture and algorithm concisely, review sequence and conceptual complexity with Astra medium, and reuse ticket-linked evidence across explanation levels. Use to help the developer reconsider an approach after implementation; do not modify application code.
---

# Apollo Solution Complexity Reviewer

Help the human developer understand the actual solution and spot opportunities to rethink its approach. This reviews the architecture and algorithm of the whole solution, beyond individual objects' compliance. Do not modify application code or automatically apply alternatives. Saving review evidence is part of this workflow.

## Establish or reuse the review

Identify the current task's changes from conversation and Git evidence, separating pre-existing work. Read the active project's [ticket record contract](../../../ai_development/ticket_review_records.md). Locate the active ticket's relevant review records and any relevant records from evidenced connected issues. If no ticket is known, use the contract's temporary storage.

Reuse a valid review when the user requests another explanation level. Verify its evidence fingerprints without repeating the investigation. Recheck only affected portions when relevant code, requirements, or constraints change, or a follow-up exposes a gap. Historical related reviews are context, not proof about current code.

If a fresh assessment is needed, trace actual behavior through the changed code and relevant collaborators. Build an internal sequence diagram showing participating objects, decisions, transformations, and responsibility boundaries. Ground it in file/symbol references and mark unknowns. Keep it out of the user-facing explanation.

## Review the architecture and algorithm

Use a separate reviewer running `gpt-6-astra` with `medium` reasoning. Supply requirements, constraints, changed code references, the internal diagram, and its evidence summary. Allow targeted conversation access to clarify intent. Treat the implementation's justification and the supplied diagram as claims to verify, rather than conclusions to defend; inspect supporting code where needed. If the runtime requires a fresh-context spawn to select a model, supply this context explicitly. Do not silently substitute another model or pretend a separate review happened when delegation is unavailable. Report the limitation and offer an assessment clearly labeled as lacking the requested reviewer.

Challenge two aspects:

- **Algorithm complexity:** Could the same required behavior use shorter, more isolated sequences within the responsible objects? Investigate long chains, repeated handoffs, mappings, and accumulating special cases. Separate an operation's internal decisions from downstream observation or interpretation of its result.
- **Conceptual complexity:** Does each introduced model, class, or wrapper serve a distinct responsibility? Could its information or behavior belong naturally in an existing object, reducing the concepts and connections needed to understand the solution?

Favor a consistent mechanism covering required cases. Universality means coherent coverage of those cases, without speculative flexibility. Complexity is a signal to investigate, not proof of a bad approach. Fewer objects or shorter chains help only when they preserve required behavior and clear responsibilities. Hiding interactions behind one method does not simplify the sequence. Respect declared architecture; use the local responsibility resolver when an ownership boundary is unclear, without redefining it from implementation behavior.

Finding no supported simplification is valid. Any alternative must be concrete, evidenced, and preserve required behavior, including difficult cases. Do not invent problems, require a finding quota, or claim the solution is the simplest possible.

Save the resulting diagram, evidence, findings, concise rationale, alternatives assessed, uncertainties, and developer decisions under the ticket record contract. Preserve this reusable assessment independently of how much of it is explained. Do not store private chain-of-thought.

## Explain concisely

Begin with a compact line reporting the actual reviewer model, reasoning effort, and explanation level, for example: `Reviewer: GPT-6 Astra · Reasoning: medium · Explanation: 1/10`. For reuse, identify these as the saved review's settings. Distinguish requested settings from confirmed settings; report unavailable or unverifiable values accurately.

Use the requested explanation level from 1 to 10; default to 1 when omitted. Level 1 is the most compressed clear explanation; level 10 allows the fullest explanation needed to understand the solution. The number controls compression, never a word or detail quota.

At every level, use the fewest words that communicate clearly and accurately. Preserve meaningful details whenever they fit naturally. Add length only when it adds understanding. Never pad, repeat, or elaborate merely because a higher number was requested. Preserve structural facts needed to understand the approach, including distributed responsibilities, even at level 1.

Explain what the implemented solution does. Keep the internal diagram and review process out of the response. Do not add unsolicited questions or tradeoff discussions. Finish with a brief confidence assessment covering simplicity, universality across required cases, and robustness, supported by one concise reason. State a supported simplification briefly for human consideration when one exists. Acknowledge insufficient evidence rather than manufacturing certainty. Subsequent level requests re-express the saved review without rerunning it when its evidence remains valid.
