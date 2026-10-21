# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/data/data_sources`

## SRP

Defines one interface for each remote, local, or cache data source required by the feature. A data-source contract uses app-owned DTOs or data declarations supplied by a generated API package.

## Allowed Direct Children

- none

## Allowed Files

- `i_*_data_source.dart`

## Naming

- Files: `i_<name>_data_source.dart`
- Interfaces: `I<Name>DataSource`
- Include a boundary qualifier such as `Remote`, `Local`, or `Cache` when it distinguishes separate data sources.

## Blueprint Required

- no

## Public Entrypoints

- none

## May Import From

- this feature's `data/dtos`
- request, response, and model declarations supplied by a generated API package
- model-only generated-library entrypoints when the package separates models from API handles

Data-source interfaces may declare the external operations required by the feature. Their methods may accept app-owned DTOs or generated API request, response, and model types. Data-source methods return app-owned DTOs or generated external response or model types. They do not return Domain entities or Domain models.

When one generated package contains both model declarations and API handles, Data may reference only the model declarations. Prefer model-specific imports. If the package exposes no model-only import path, define an app-owned DTO in `data/dtos` instead of importing the mixed API barrel.

## May Be Imported By

- /lib/features/feature_name/infrastructure/data_sources
- /lib/features/feature_name/infrastructure/repositories
