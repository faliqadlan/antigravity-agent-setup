---
name: fetching-voltagent-skills
description: Search the VoltAgent/awesome-agent-skills GitHub repository for official, curated agent playbooks and present them for user approval before installation.
---

# Fetching VoltAgent Skills

When you encounter a task that requires specialized knowledge or a structured workflow that you do not currently have a skill for, follow this procedure to find and install an official skill from the VoltAgent curated repository.

## Procedure

### Step 1: Search for the Skill
Use `search_web` with a query targeting the VoltAgent repository. For example:
```
site:github.com VoltAgent/awesome-agent-skills "<technology or task name>"
```
Alternatively, use `read_url_content` to browse the VoltAgent repository directly at:
```
https://github.com/VoltAgent/awesome-agent-skills
```

### Step 2: Evaluate Quality
Before recommending a skill to the user, verify the following:
- The skill has proper documentation (a `README.md` or `SKILL.md` file with clear instructions).
- The skill is attributed to an official source (for example, a skill published by Vercel, Anthropic, Google, Stripe, or Sentry).
- The skill has evidence of community adoption (stars, forks, or citations in other repositories).

### Step 3: Present to the User
Provide the user with:
- The skill name and source.
- A brief summary of what the skill does.
- Your recommendation on whether to install it.
- Any potential risks or limitations.

### Step 4: Install (Only After Approval)
If the user approves:
1. Read the full skill content using `read_url_content`.
2. Create the skill directory at `.agents/skills/<skill-name>/`.
3. Write the skill content to `.agents/skills/<skill-name>/SKILL.md`.
4. Confirm successful installation to the user.

## Important Notes
- Never install a skill without explicit user approval.
- Prefer skills from official engineering teams over community-submitted ones.
- If no suitable skill is found in VoltAgent, inform the user and offer to write a custom skill instead.
