# Plan: Generate Apollo's Dart REST client from its backend contract

Developer request: “now we need to plan open api generator that should smoothly connect with given open ai scheme , specifically with our backend we have example how it is designed in foot union. what do you think?”

The developer also requested related ticket and milestone discovery. This is a proposal for the Apollo Flutter scaffold (`apollo1`), recorded in the architecture blueprint workspace. FootUnion is a reference. The Apollo backend owns the contract. The proposal is now tracked in [GitHub issue #14](https://github.com/konstantinvoronov/apollo-declarative/issues/14).

## What to reuse

FootUnion generates a local Dart/Dio package per backend service from that service's OpenAPI definition, then runs Dart serialization generation. Its Flutter app owns Dio configuration and interceptors. Its score script explicitly converts OpenAPI 3.1 to 3.0; that conversion is a service-specific precedent, not a requirement for Apollo.

Apollo already exposes a versioned FastAPI REST contract. The current backend source defines `GET /identity/me` with operation ID `getIdentity`, and `GET /transport/probe` with `probeTransport`. The probe requires `infrastructure:probe`; ordinary identity lookup does not. The documented contract uses a Firebase ID token as HTTP bearer credentials, a JSON error envelope, and server-generated request IDs. Backend issue #9 records a generated Python client passing authenticated JSON calls against an HTTPS fixture. That evidence does not establish Dart compatibility.

## Proposed first issue: Generate and verify the Apollo Dart REST client

Keep contract generation, the generated package, and its proof in one frontend tooling delivery. This is development tooling and a generated HTTP transport dependency. It introduces no new Flutter runtime service or feature class.

| Proposed Apollo scaffold path | Responsibility |
| --- | --- |
| `tools/openapi/openapi.json` | Record the versioned input exported from a known backend revision and configuration. Record the source revision/profile and checksum alongside it. |
| `tools/openapi/dart_dio.yaml` | Define the package name and generator settings. Try the FootUnion serializer on the real contract and pin the version that passes. |
| `tools/generate_api.sh` | Run validation, generation and serializer build with pinned inputs. Generate into a clean directory and provide a drift check against the committed output. |
| `packages/apollo_api_client/` | Own generated HTTP methods and wire models as a local Dart package. Commit the reviewed output, including serializer files. |
| `tools/openapi/` (smoke test and instructions) | Document contract updates and exercise the generated client against a disposable backend fixture. |

Keep fetching/exporting a new backend snapshot an explicit action; ordinary regeneration and CI consume the checked-in input. Start with the stable `getIdentity` operation and use `probeTransport` as a test probe if needed for the 403 check. Select ordinary REST operations explicitly so streaming, website, and internal routes do not enter the client by accident. Preserve shared schema references and security declarations. Try the actual OpenAPI document as emitted first. Add a small versioned transformation only if a test demonstrates that the pinned generator needs one; assert preservation of relevant nullability, enum values, error bodies, and security metadata.

Acceptance: two clean generations from the same input produce identical output; the package analyzes and builds on Apollo's Dart toolchain; the generated call decodes a real fixture's typed identity response; an invalid token yields the backend's 401 error shape and request ID; a protected probe without its permission yields 403. Verify base URL injection separately from spec provenance. Test that a proxy or network failure can be handled without assuming every failure has the backend's JSON shape. CI should fail when the contract, config and generated output drift. No product UI or provider provisioning is needed for these checks.

## App integration and tracking

- [Backend infrastructure milestone](https://github.com/konstantinvoronov/apollo-declarative/milestone/1): [#9](https://github.com/konstantinvoronov/apollo-declarative/issues/9) is closed and supplies the REST contract and prior smoke evidence. [#8](https://github.com/konstantinvoronov/apollo-declarative/issues/8) supplies Firebase identity and is still open in GitHub. The Dart smoke can use the existing fixture; app acceptance follows the existing identity dependency.
- [Frontend features milestone](https://github.com/konstantinvoronov/apollo-declarative/milestone/2): propose the tooling issue here and make it a dependency of [#4 sign-in](https://github.com/konstantinvoronov/apollo-declarative/issues/4). Keep real Firebase token acquisition, token refresh/logout handling and Firebase-only mode under #4. [#5 profiles/settings](https://github.com/konstantinvoronov/apollo-declarative/issues/5) already calls for generated REST bindings and can extend the same package. [#7 chat](https://github.com/konstantinvoronov/apollo-declarative/issues/7) owns its separate SSE/WebSocket client behavior.
- In #4 the hand-written feature Infrastructure data source calls the generated API; Data maps the wire representation into app-owned types. Domain and Presentation do not import the generated package. Inject the backend URL and current Firebase ID token through Apollo-owned wiring. Translate failures at that boundary and log only safe fields such as status, error code and request ID. The existing Apollo Dio failure wrapper captures raw request headers/body; check its redaction behavior before using it with authenticated requests. Resolve the actual adapter path and dependency permissions when the #4 feature is planned.

Planning decomposition: **SPLIT RECOMMENDED** between the reusable frontend generator and existing feature integration. Keep the first issue's contract snapshot, runner, package, smoke check and instructions together as one reviewable change. The scoped tracker search found no dedicated generator issue; FootUnion tracker access was unavailable, so its local checkout supplied the comparison.
