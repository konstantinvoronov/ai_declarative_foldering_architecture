# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain/models`

## SRP

Contains immutable Domain value structures, enums, and composed business models that describe same-feature business concepts without independent identity or lifecycle. A model may combine multiple same-feature Domain entities or models and may add derived Domain information. Models contain data and pure value behavior.

## Allowed Direct Children

- none

## Allowed Files

- `*.dart`

## Naming

- Files: `<business_concept>.dart`
- Declarations: singular responsibility-based business concept names
- Examples: `GameMode`, `MoneyAmount`, `MatchSummary`
- A `Model` suffix is used only when it is part of the business concept's established name.

## Blueprint Required

- no

## Public Entrypoints

- `*.dart` within the same feature
- cross-feature and Core Manager access is exposed through this feature's `domain/shared`

## May Import From

- this feature's `domain/entities`
- this feature's `domain/models`
- other features' Domain declarations through their `domain/shared` entrypoints

## May Be Imported By

- this feature's Domain layer
- this feature's Data layer, as allowed by its applicable child-folder rules
- this feature's Infrastructure layer
- this feature's Presentation layer, as allowed by its applicable child-folder rules
- other features and `/lib/core/managers`, through this feature's `domain/shared`

## Forbidden

- none beyond cumulative rules and the allow-lists above
