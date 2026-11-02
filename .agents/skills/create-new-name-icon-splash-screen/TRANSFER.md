# Transfer to main Apollo or another fork

Copy this entire directory, including agents/ and references/, into the destination project's .agents/skills/. It is self-contained: no TrailTelling code, images, device IDs or credentials need to be copied. The Codex skill name is `create-new-name-icon-splash-screen` (hyphens are the standard skill-name format).

From the repository containing this skill, run the following after replacing the destination path. It stops if the destination skill already exists, so an older/customized version is not overwritten:

```bash
APOLLO_ROOT="/absolute/path/to/main-apollo"
SKILL_NAME="create-new-name-icon-splash-screen"
SOURCE_SKILL="$PWD/.agents/skills/$SKILL_NAME"
DEST_SKILL="$APOLLO_ROOT/.agents/skills/$SKILL_NAME"
test -d "$APOLLO_ROOT" && test -f "$SOURCE_SKILL/SKILL.md" &&
  mkdir -p "$APOLLO_ROOT/.agents/skills" &&
  test ! -e "$DEST_SKILL" &&
  cp -R "$SOURCE_SKILL" "$DEST_SKILL"
```

If it already exists, compare both directories and merge the intended updates. Do not replace the destination's whole .agents folder or its AGENTS.md files. No sync manifest change is required for this direct copy; do not run a whole-harness synchronization merely to install this skill. If main Apollo maintains an explicit shared-skill manifest, review adding these files as a separate, scoped maintenance change before using that sync workflow for distribution.

Open a new Codex chat in main Apollo so its project-local skills are discovered. If necessary, attach the copied SKILL.md explicitly. Example request:

> Use $create-new-name-icon-splash-screen to rename this app to My App and update its iOS and Android icons and native splash for light and dark mode. Use the approved artwork in assets/branding/. Keep the current application IDs and match the first page's theme.

For a full identity migration, explicitly provide the desired bundle/application IDs instead of asking to keep them. Supply actual artwork paths and colors, or ask for icon design first. The skill will inspect the destination's architecture and startup flow rather than assuming they match TrailTelling.

Review and commit only the copied skill in the destination repository. To validate its structure when the skill-creator tools are installed:

```bash
python3 "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py"   "$APOLLO_ROOT/.agents/skills/create-new-name-icon-splash-screen"
```

The validator is optional for transfer and is not a runtime dependency of the skill.
