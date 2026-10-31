---
name: discover-related-tickets
description: Find evidenced related issues, tickets, and milestones for an active task and return focused context to the decomposer. Use when related-ticket discovery is requested; discovery does not edit the tracker or decide task scope.
---

# Discover Related Tickets

Discover project-management context for the active ticket. Use the active project's [ticket record contract](../../../ai_development/ticket_review_records.md). Return evidence to the caller; the decomposer decides relevance and any task changes.

## Find related evidence

Resolve the tracker, project or repository, and active ticket from the task and connected tools before asking for missing identity. Use the service's available connector first. Inspect explicit issue links, parent/child relationships, dependencies, duplicates, and assigned milestone or epic metadata. Start with direct relationships. Search the same project for focused candidates only when useful; distinguish search matches from established relationships. Do not crawl every milestone member or recursively expand the issue graph without a task-specific reason.

Consult relevant retained issue records and review summaries. For each useful candidate, return its canonical identifier and URL, observed relationship and source, concise relevant requirements or decisions, status, and retained artifact paths. Include conflicts, unavailable sources, and the scope searched. Absence of access is not evidence that no related issues exist. Use current tracker facts when available and label older local evidence as historical.

## Return and retain

Group established links and unconfirmed candidates separately. Explain relevance in a concise sentence per useful issue, including milestone context only when it affects the task. Stop when the active question is answered or further expansion needs a scope decision. Save useful discovery evidence in the active ticket's `related_issues.md`, preserving existing developer decisions; in read-only audit mode return the evidence without writing.

Do not change ticket descriptions, create links or milestones, post comments, or broaden implementation scope. Return proposed relationships and context to `task-decomposer` for evaluation and any authorized tracker update.
