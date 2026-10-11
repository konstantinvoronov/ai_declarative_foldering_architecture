# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name`

## SRP

Contains one complete app feature divided into Domain, Data, Infrastructure, and Presentation layers. The feature-root `di.dart` is the feature's single public DI entrypoint and composes every feature-local registration.

## Allowed Direct Children

- `ai_development`
- `data`
- `domain`
- `infrastructure`
- `presentation`

## Allowed Files

- `di.dart`

## Naming

- Folders: `snake_case`
- DI file: `di.dart`
- DI registration function: `register<FeatureName>Feature`

## Blueprint Required

- yes: recreate this complete feature structure and every matching `AGENTS.md`

## Public Entrypoints

- `di.dart`: the only public feature DI entrypoint; global App DI imports and explicitly calls its `register<FeatureName>Feature` function
- `presentation/routing.dart`: the public feature routing entrypoint used by global App routing
- `domain/shared/*`: selected Domain exports for permitted cross-feature consumers
- `infrastructure/shared/*`: selected Infrastructure exports for other features' Infrastructure layers
- `presentation/shared/*`: selected Presentation exports for permitted cross-feature consumers

## May Import From

- `/lib/app`
- `/lib/core` entrypoints allowed by the applicable feature-layer rules
- `/lib/shared`
- `/lib/libs`
- files inside this feature allowed by the applicable layer rules
- other features only through `domain/shared`, `infrastructure/shared`, or `presentation/shared`, as allowed by the importing layer

## May Be Imported By

- `/lib/app`, through `di.dart` and `presentation/routing.dart`
- `/lib/core/managers`, through `domain/shared`
- other features through `domain/shared`, `infrastructure/shared`, or `presentation/shared`, as allowed by their importing layer

## Forbidden

- additional files at the feature root
- direct imports of another feature's internal files
