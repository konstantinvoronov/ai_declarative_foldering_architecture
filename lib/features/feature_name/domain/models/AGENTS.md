# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain/models`

## SRP

Contains immutable Domain value structures, enums, and composed business models that describe scope-owned business concepts without independent identity or lifecycle. A model may combine same-scope Domain entities or models and permitted Core Domain values and may add derived Domain information. Models contain data and pure value behavior.

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

## Forbidden

- none beyond cumulative rules and the allow-lists above
