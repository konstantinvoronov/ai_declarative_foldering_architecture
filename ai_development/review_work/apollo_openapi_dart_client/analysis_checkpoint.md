# Apollo OpenAPI Dart client — planning checkpoint

Scope: generator proposal only, no implementation or tracker changes. Current blueprint revision: `6e10518`; Apollo Flutter scaffold: `2498e71`; Apollo backend: `8b1a85e`. See [the plan](implementation_plan.md) for the request, repository comparison, intended dependency boundary and proposed issue.

Context check: **UNVERIFIED** for generation compatibility. Consulted the active harness, project management and ticket-record conventions, relevant blueprint and Apollo Flutter layer guides, the Apollo backend transport spec and source, retained issue #9 verification, FootUnion's scripts and Dio client, and the GitHub Apollo issues and milestone membership. The published OpenAPI URL was not reachable from this environment; no Dart regeneration, compilation, or network smoke test was performed. FootUnion tracker access was unavailable. No architectural rule change is proposed for the tooling issue; concrete feature placement remains a later #4 check.

Next: confirm the proposed tooling issue scope, then obtain a versioned schema export and use the disposable backend fixture for the first Dart generation and smoke test.
