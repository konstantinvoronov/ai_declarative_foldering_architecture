# Ticket Context and Review Records

## Storage and ownership

Keep reusable ticket evidence in the active project's `ai_development/issue_context/<issue_key>/`. Build a filesystem-safe key from the provider, project or repository, and ticket identifier; preserve the original identifier and canonical URL inside each record. For example, GitHub issue 42 needs its repository identity as well as its number. Reuse an established project convention when it provides the same unambiguous ownership.

Store related-ticket evidence in `related_issues.md` and solution reviews in `solution_review_<scope_fingerprint>.md`. Keep distinct reviewed scopes or revisions separate. Create only records the task needs. These are project-owned evidence, not shared harness definitions or new architectural authority. Do not synchronize their contents between projects.

When no ticket is known, use `ai_development/review_work/<job_key>/` temporarily. Do not invent an issue identifier or silently create a ticket. Record temporary artifacts created by the job in that folder's `artifact_inventory.md`, including their purpose, ownership, and whether useful evidence has been retained elsewhere. Use safe path components; never use a remote title or URL as a filesystem path.

## Reusable solution review

Save an evidence summary, not private chain-of-thought or a transcript of internal deliberation. Include:

- ticket identity, review date, repository, task scope, and required behavior;
- actual reviewer model and reasoning effort, distinguishing requested settings from verified settings;
- reviewed base/head commits where available, plus content fingerprints of relevant working-tree and untracked files, inspected collaborators, requirements, and governing constraints; include additions and deletions;
- the internal sequence diagram, object responsibilities, and supporting file/symbol references;
- findings, concrete alternatives assessed, concise reasons for conclusions, uncertainties, and the confidence assessment;
- developer decisions, distinguishing proposals from accepted changes, and the inventory of temporary artifacts belonging to this review.

Use a stable content fingerprint for the reviewed scope; a commit ID alone does not identify uncommitted behavior. A changed explanation level does not invalidate a review. Before reuse, compare relevant files, requirements, and constraints with the saved scope, including changed callers or newly connected paths. Recheck affected portions when they change or a follow-up exposes a gap. If coverage cannot be established, mark the record stale or unverified and inspect the necessary evidence. Preserve prior results as history instead of presenting them as current verification.

## Related-ticket evidence

Record canonical links and identifiers, observed relationship types, the source and date of discovery, concise relevant requirements or decisions, retained-review paths, relevance decisions, and access/search limitations. Distinguish tracker-declared links from search candidates and developer-confirmed relationships. A matching title or shared milestone alone does not establish a dependency. Avoid copying unrelated ticket bodies or sensitive raw data.

## Retention and finalization

Reuse the ticket's records when it is reopened or when an evidenced related issue needs them. Load relevant summaries first and expand only when necessary. Historical reviews inform investigation; current requirements and code still need verification.

Before final read-only verification, retain useful ticket-linked diagrams, evidence, decisions, and conclusions in the issue folder. Verify that retained records contain useful evidence before removing redundant temporary copies. Delete only explicitly inventoried temporary files created by the current job, within its owned work folder, whose useful contents have been retained or are no longer needed. Do not follow symlinks or perform broad cleanup of other reviews, logs, histories, or unrelated files. If ownership or retention is uncertain, leave the file and report it. Useful unassigned records remain pending ticket association. Audit-only invocations report proposed retention/cleanup without writing or deleting.
