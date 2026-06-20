# Workspace Rules: antigravity-agent-setup

This repository serves as the shared memory and configuration hub for all Antigravity agents across multiple laptops.

## Project Context

- This repository (`faliqadlan/antigravity-agent-setup`) is a personal learning hub for AI Agent development and Antigravity configuration.
- All documentation, research guides, and comparison artifacts are stored here as Markdown files.
- The `global_config/` directory contains the master copy of Global Antigravity rules and skills. These are deployed to each laptop via `setup.sh`.

## GitHub Memory Sync

- This repository serves as shared memory between multiple laptops (for example, Jombang and Jogja).
- After completing any major milestone (finishing a research topic, creating a guide, making a significant decision, or modifying configuration files), automatically run:
  1. `git add .`
  2. `git commit -m "<descriptive message>"`
  3. `git push origin main`
- Do not commit after every single response. Only commit after meaningful progress has been made.

## Session Log

- Maintain a single `SESSION_LOG.md` file at the root of this repository.
- At the end of each conversation session or after major milestones, append a new entry summarizing:
  - Date and time.
  - Topics discussed.
  - Decisions made.
  - Files created or modified.
- Always commit and push the updated session log alongside other changes.
