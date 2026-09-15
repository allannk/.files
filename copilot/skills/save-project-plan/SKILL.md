---
name: save-project-plan
description: Create or update a durable Markdown implementation plan from the current GitHub Copilot chat and workspace context. Use when the user asks to save, capture, persist, document, update, resume, or reference the plan for the project or current task. Also invoked by the Persistent Planner agent to persist plans.
argument-hint: "[optional plan title or existing plan path]"
---

# Save Project Plan

Create a durable Markdown plan from the current conversation and repository context.

1. Inspect the workspace as needed, but do not modify product code.
2. Store plans under `docs/plans/`.
3. Create or maintain `docs/plans/README.md` with a simple list of plans sorted by filename (most recent first).
4. Use `docs/plans/YYMMDD-HHmm-<short-kebab-title>.md` for new plans; update an explicitly supplied path in place.
5. Plan format — dense with detail, no boilerplate, no conclusion:
   ```markdown
   # <Title>

   > One-sentence statement of what this plan achieves and why.

   ## Decisions

   | Decision | Rationale | Status |
   |---|---|---|

   ## Implementation Plan

   ### Phase 1 — <name>

   - [ ] `path/to/file` — exact change and how to verify it

   ## Open Questions

   <!-- Remove this section when empty. -->
   ```
6. On updates: preserve completed checklist items; merge decisions; move resolved open questions into Decisions.
7. Report the saved path and the most important unresolved decision.
