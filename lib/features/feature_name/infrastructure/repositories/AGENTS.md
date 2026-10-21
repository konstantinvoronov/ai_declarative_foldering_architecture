# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/infrastructure/repositories`

## SRP

Contains concrete implementations of this feature's Domain repository contracts. Every repository implements its matching public interface from this feature's `domain/repositories` folder, calls Data Sources through interfaces from `data/data_sources`, and uses Data mappers to convert returned DTOs or generated external representations into Domain entities or Domain models.

## Allowed Direct Children

- none

## Allowed Files

- `*_repository.dart`

## Naming

- Files: `<name>_repository.dart`
- Classes: `<Name>Repository`
- Implemented interfaces: `I<Name>Repository`

## Blueprint Required

- no

## Public Entrypoints

- none outside the feature

These concrete files may be imported only by this feature's private `infrastructure/di.dart` construction helper. Other files in the same directory are not additional consumers.

## May Import From

- /lib/features/feature_name/domain/*
- /lib/features/feature_name/data/data_sources
- /lib/features/feature_name/data/dtos
- /lib/features/feature_name/data/mappers
- /lib/shared/*
- /lib/core/*
- !/lib/core/flows/*
- !/lib/core/managers/*
- /lib/libs/*

## May Be Imported By

- /lib/features/feature_name/infrastructure

## Forbidden

- direct imports of concrete `infrastructure/data_sources` implementations
