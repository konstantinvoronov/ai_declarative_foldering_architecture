---
name: setup-apollo-declarative
description: Set up a derived Apollo application with its name, application IDs, project management choice, and optional registration, icon, and upstream follow-ups. Use on explicit setup requests or the root guide's incomplete-default-project trigger.
---

# Setup Apollo Declarative

Use the active project's [project management conventions](../../../ai_development/project_management.md). Resume confirmed answers and recorded follow-ups from its setup record.

Ask for the application display name, iOS bundle ID, and Android application ID. Record the confirmed choices; application identity changes follow the project's implementation and approval workflow.

Offer help registering the application in App Store Connect and Google Play Console. For each accepted offer, create a separate project chat with the confirmed identity and an explicit goal to complete that store's application registration. Let the registration chat establish account prerequisites and complete the process with the developer. Tell the developer which chats were actually created and record their references. Reuse an existing matching registration chat when resuming.

Ask which project management system or plugin to use, recommending GitHub with GitHub Projects. Establish the selected repository/project and the available state/dashboard mapping under the shared conventions.

Offer an app-icon chat. On acceptance, create a separate project chat invoking the local `create-icon-apollo-declarative` skill with the confirmed app details. Explain that its current version is a placeholder and record the chat reference.

Offer to star [Apollo Declarative](https://github.com/konstantinvoronov/apollo-declarative). Act on acceptance using an available authorized capability. After the star is confirmed, offer to subscribe to repository updates and act on acceptance. If an action needs manual completion, provide its repository link and record the actual outcome.

Explain that the local `update-framework-harness` skill reviews upstream changes for selective adoption. Ask whether to check now; run that skill when accepted and retain its baseline and approval procedure.

Use the available project-chat tools for accepted follow-ups and include their registration goals in the opening prompts; set an explicit goal within each registration chat when goal tracking is available. Report unavailable capabilities and retain the accepted follow-up as pending. Finish by saving setup progress under the shared completion convention.
