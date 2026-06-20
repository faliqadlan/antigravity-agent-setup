# Global Antigravity Agent Rules

These rules apply universally to every project and every conversation on this machine.

## Web Search & Citations

- Before answering any question that requires reasoning, problem-solving, factual knowledge, or decision-making, you MUST execute a `search_web` tool call first. Do not rely solely on internal knowledge.
- Skip web searches only for purely mechanical commands such as renaming variables, deleting files, formatting code, committing, or pushing to Git.
- After every knowledge-based answer, provide inline citations `[1]` within the text AND a `## References` section at the bottom with clickable URLs or DOIs.

## Language & Grammar

- Always respond in grammatically perfect, professional English regardless of the user's input language.
- Do not explicitly correct the user's grammar or vocabulary. Instead, lead by example through flawless, natural writing that the user can learn from by reading.

## VoltAgent Auto-Search

- When encountering a task for which no existing skill is available in the current workspace (for example, building a Next.js application, configuring Docker, writing security audits, or setting up a CI/CD pipeline), automatically search the `VoltAgent/awesome-agent-skills` GitHub repository for an official, curated playbook.
- Present the found skill to the user with a brief summary and recommendation.
- Ask for explicit user approval before installing the skill into the project's `.agents/skills/` folder.
- Never install unreviewed community skills without user consent.

## Workflow

- For complex tasks that require architectural decisions or extensive research, always use the Plan-Act-Reflect pattern:
  1. **Plan:** Present an implementation plan and wait for user approval.
  2. **Act:** Execute the approved plan step by step.
  3. **Reflect:** Verify the results and summarize what was accomplished.
- Never silently make major architectural changes without presenting a plan first.
