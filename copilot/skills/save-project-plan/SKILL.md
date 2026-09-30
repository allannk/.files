---
name: save-project-plan
description: Create or update a durable Markdown implementation plan from the current GitHub Copilot chat and workspace context. Use when asked to save, capture, persist, or revise a plan, after a short planning conversation with a general agent, or when xeran-planner is ready to save or revise a plan.
argument-hint: "[optional plan title or existing plan path]"
---

# Save Project Plan

Persist the plan developed in the current conversation. This skill owns the plan file format, naming, index, and revision rules for plans saved by any agent. It does not require a full planning interview: use the decisions and research already available, inspect the workspace as needed, and ask about any blocking unknowns rather than inventing details. Do not modify product code while saving a plan.

## Plan storage

Store plans under the repository-root `docs/plans/` directory. Create or maintain `docs/plans/README.md` with the index format below.

Name new plans `NNN-task-name.md`: use a zero-padded 3-digit sequence number one higher than the highest existing prefix in `docs/plans/*.md` (start at `001` if none exist), plus a short kebab-case slug under 60 characters. If the conversation continues an existing plan or supplies its path, update that plan instead of creating a duplicate. Never overwrite an unrelated plan.

## Plan content

Make the plan dense with detail and free of filler; omit sections without meaningful content. A small plan may have just one phase. Each phase must be standalone-executable: name confirmed files, functions, and state it depends on, and give concrete, testable tasks. State unconfirmed paths as assumptions. Specify how each phase could be verified, including a concrete command and expected result when known, but instruct the implementer to stop and report after each phase rather than automatically running builds or tests; the user decides when to verify.

Keep a human-facing plan above an appendix with factual research and decisions. Use this structure:

```markdown
# <Title>

> One-sentence statement of what this plan achieves and why.

## Implementation Plan

### Phase 1 — <name>

- [ ] `path/to/file.c` — make this exact change in `foo()`; verify by checking X. Stop and report completion before another phase.

### Phase 2 — <name>

- [ ] ...

## Open Questions

<!-- Remove this section when empty. -->

## Definition of Done

- [ ] <Task-specific acceptance criterion>

---

## Appendix: Context & Decisions

### Context Gathered

<!-- Omit this subsection when empty. -->
- <Short factual finding: exact path, existing convention, or constraint>

### Decisions

<!-- Omit this subsection and its table when there are no decisions. Omit the entire appendix if both subsections are empty. -->
| Decision | Rationale | Status |
|---|---|---|
```

Do not add a conclusion, next-steps summary, or closing remarks to the plan.

## Index maintenance

Maintain `docs/plans/README.md` in this format, sorted by filename with the highest number first:

```markdown
# Project Plans

| Plan |
|---|
| [Plan title](./filename.md) |
```

## Revisions

- Preserve completed checklist items unless the user explicitly reverses them.
- Merge decisions instead of duplicating them; move resolved open questions into `Decisions`.
- Make the plan understandable without access to the chat transcript.
- Clearly label assumptions and unresolved decisions.

Report the saved path, plan status, most important unresolved decision (or `None`), and whether the plan is ready for implementation.
