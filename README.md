# Antigravity Agent Setup & Shared Memory

This repository serves as the central configuration hub, shared memory, and learning journal for my personal Antigravity AI Agent setup. It ensures that my Antigravity agent remains equally "smart" and context-aware across multiple laptops (e.g., Jombang and Jogja).

## Core Philosophy

This setup adopts the **Strict Curation** approach for AI Agent Skills:
*   We prioritize **Quality over Quantity**. Instead of mass-installing thousands of community scripts, we only use officially vetted playbooks.
*   We use the **VoltAgent** model: The agent automatically searches the `VoltAgent/awesome-agent-skills` repository for high-quality skills when needed, but always asks for human approval before installing.
*   We enforce the **Plan-Act-Reflect** workflow for all complex tasks to reduce hallucination and save tokens.

## Repository Structure

The repository is divided into two distinct scopes: Global vs. Workspace.

```text
antigravity-agent-setup/
├── global_config/                          ← Master copy of Global Rules (synced via GitHub)
│   ├── AGENTS.md                           ← Universal rules (Web Search, Citations, Language)
│   └── skills/                             ← Global skills available to all projects
│       └── fetching-voltagent-skills/      ← Meta-skill for VoltAgent integration
├── .agents/                                ← Workspace Rules (auto-loaded by Antigravity)
│   └── AGENTS.md                           ← Project-specific rules (GitHub sync, SESSION_LOG)
├── setup.sh                                ← Cross-platform deployment script
├── SESSION_LOG.md                          ← Running conversation memory across laptops
├── AI_Agents_Comprehensive_Guide.md        ← Research artifact on Agentic Design Patterns
└── Agent_Skills_Repo_Comparison.md         ← Comparison of Top Agent Skill Repositories
```

## How to Sync a New Laptop

When moving to a different laptop, follow these steps to instantly make the local Antigravity agent smart:

1. Clone or pull the latest changes from this repository:
   ```bash
   git clone https://github.com/faliqadlan/antigravity-agent-setup.git
   cd antigravity-agent-setup
   # OR if already cloned:
   git pull
   ```
2. Run the deployment script. This script safely copies the contents of `global_config/` into your laptop's universal `~/.gemini/config/` directory:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```
   > [!TIP]
   > The script automatically installs a Git `post-merge` hook in your local repository. For any future updates, simply running `git pull` will automatically trigger the deployment of new rules/skills in the background!
3. Open a new Antigravity session. The agent is now fully upgraded with the latest global rules and skills.

## Agent Capabilities & Rules

By running the setup script, the agent on any laptop inherits the following universal behaviors:
*   **Web Search:** Automatically searches the web for any problem-solving or reasoning tasks before answering.
*   **Citations:** Provides academic-style inline citations `[1]` and a references section at the bottom of knowledge-based answers.
*   **English Language:** Always responds in grammatically perfect English to facilitate passive language learning.
*   **Memory Sync:** Automatically tracks major milestones in `SESSION_LOG.md` and commits/pushes to GitHub so the other laptop can catch up.
