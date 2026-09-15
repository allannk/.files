---
name: planner
description: >
  Extended planning workflow that turns a large, vague task into a detailed,
  numbered implementation plan document (docs/plans/NNN-task-name.md) with
  concrete, standalone phases another agent can execute without going off
  track. Interviews the user to resolve ambiguity, explores the codebase
  read-only for facts, then writes the plan. Does NOT write implementation
  code itself. Use when the user asks to "plan", "write an implementation
  plan", "design doc", "spec out", "break this down into phases", or before
  starting a large/multi-file feature where losing context mid-implementation
  is a risk. Invoke as /planner <task description>.
argument-hint: '<short description of the task to plan>'
---

# Planner

Turn a large task into a written plan another agent (or your future self)
can execute one phase at a time without re-deriving context or drifting.

## Hard rule

This skill **only produces the plan document**. Never write, edit, or
scaffold implementation code as part of planning — not even "just to check
it compiles." If asked to also implement, finish the plan doc first, get it
confirmed, then treat implementation as a separate, later task.

## Workflow

### 1. Interview first

Before exploring or writing anything, use the ask-questions tool to resolve
ambiguity. Don't guess at requirements for a plan that will be executed
later without you around to clarify. Ask about:
- Scope boundaries (what's explicitly out of scope)
- Constraints (performance, hardware, backward compatibility, deadlines)
- Preferences when multiple valid approaches exist
- Anything the task description assumes but doesn't state

Keep asking in short rounds until the shape of the solution is clear enough
to explore the codebase with purpose. It's fine to interleave: explore a
bit, ask a follow-up, explore more.

### 2. Explore the codebase read-only

Always ground the plan in facts, not assumptions. Use search/read tools
(never edit tools) to confirm:
- Where the relevant code/config actually lives (exact file paths)
- Existing patterns/conventions to follow (naming, error handling, structure)
- Real constraints (e.g. build system, memory limits, existing dependencies)
- Anything that blocks the naive approach (missing abstractions, singleton
  assumptions, hardware limits, etc.)

Record findings as short factual bullets — these become the "Context
gathered" section. Prefer a read-only subagent (e.g. Explore) for wide
searches to keep the main conversation focused.

### 3. Determine the output file

- Default location: `docs/plans/` in the target repo. Create the directory
  if it doesn't exist.
- Naming: `NNN-task-name.md` — `NNN` is a zero-padded 3-digit sequence
  number, `task-name` is a short kebab-case slug of the task.
- Auto-detect `NNN`: list `docs/plans/*.md`, take the highest existing
  prefix, add 1 (start at `001` if the directory is empty/new).
- If the repo has its own documented convention for plan docs (check
  `docs/plans/`, repo-level agent instructions, or ask if truly unclear),
  follow that instead of the default template.

### 4. Write the plan

Use the [plan template](./assets/plan-template.md) as the skeleton. Key
principles while filling it in:

- **Each phase must be standalone-executable.** An implementation agent
  picking up phase 3 should not need to have read phases 1–2 in detail —
  restate the specific files/state it depends on inline.
- **Small, verifiable chunks.** Each phase ends with an explicit
  build/test/validate step (exact command to run, or what to check) before
  moving to the next phase — never batch multiple phases before validating.
  This mirrors the general engineering principle: trace root causes, don't
  let errors compound across unvalidated phases.
- **Concrete over abstract.** Name exact files, functions, structs, config
  keys — not "update the relevant handler." If a phase touches a file you
  haven't confirmed exists, say so explicitly as an assumption.
- **Capture decisions, not just tasks.** Where you (with the user) chose one
  approach over another, record the decision and the one-line reason, so the
  implementer doesn't re-litigate it.
- **Flag unknowns instead of hiding them.** If something couldn't be
  resolved by exploring or asking, put it in "Open questions" rather than
  quietly picking an assumption and moving on — unless it's low-stakes, in
  which case state the assumption inline and move on.
- **End with a Definition of Done** checklist covering the whole task, not
  just "all phases complete" — include things like "no new warnings",
  "existing tests still pass", "docs updated" if relevant.

### 5. Confirm before finishing

Show the user a brief summary of the plan's phase breakdown (not the whole
file) and confirm it matches their intent before considering the task done.
Adjust and re-save if they push back.

## Non-goals

- Not for small, single-file changes — just make those directly.
- Not a replacement for the interview: a plan built on unconfirmed
  assumptions is worse than no plan, because it gives false confidence to
  whoever implements it later.
