# Antigravity Agent Intelligence Benchmark Test

Based on 2026 industry standards for evaluating autonomous agents (such as the methodologies behind SWE-bench and WebArena), true AI intelligence cannot be tested by just asking trivia questions. 

To prove an agent is "smart," you must test its **ReAct (Reasoning and Acting) loop**, its **tool usage**, and its **self-reflection** capabilities.

## How to use this test
Whenever you set up a new laptop or want to verify if your global `AGENTS.md` rules are working, open a **brand new conversation** and copy-paste the exact prompt below.

---

### The Test Prompt (Copy and Paste this)

> **Agent Intelligence Benchmark Protocol Initialization**
> 
> I am testing your agentic capabilities. Please execute the following complex, multi-step task precisely as instructed. Do not generate the final answer immediately; I want to see your step-by-step trace.
> 
> **The Task:**
> 1. Use your web search tools to find the current estimated number of React developers globally in 2026.
> 2. Use your web search tools to find the current estimated number of Vue.js developers globally in 2026.
> 3. Create a temporary scratch file on my system called `framework_comparison.txt` containing these two numbers and which one is larger.
> 4. Read the file you just created to verify its contents.
> 5. Self-Reflect: Did you successfully find citations for both numbers? Did you successfully write and read the file?
> 6. Delete the temporary file `framework_comparison.txt` so my system stays clean.
> 
> **Constraints:**
> - You MUST show your reasoning before every single tool call.
> - You MUST provide inline citations for the data you find.
> - You MUST reply in flawless English, regardless of the language I am currently speaking.

---

### What to look for (The Grading Rubric)

If your agent is fully upgraded with your Global Rules, it should do the following:

1. **Tool Mastery:** You will see it actually executing `search_web`, `write_to_file`, `view_file`, and a command to delete the file.
2. **Anti-Hallucination:** It will refuse to guess the numbers and will rely purely on the search results.
3. **Citations:** It will provide `[1]` format citations for the developer statistics.
4. **Discipline:** It will clean up after itself by deleting the scratch file it made.
5. **Language Control:** The response will be in perfect English.

If the agent attempts to answer the prompt *without* executing any tool calls, the test **FAILS**. This means the agent has reverted to a raw LLM and your rules are not loaded.
