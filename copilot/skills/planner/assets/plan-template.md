# Plan: <Task title>

## Goal

<1-3 sentences: what this achieves and why. What "done" looks like at a
product/user level, not just technically.>

## Context gathered

<Bullet list of concrete facts found by exploring the codebase: exact file
paths, existing patterns, relevant constraints. Each bullet should be
something the implementer can trust without re-checking.>

- ...

## Decisions made

<Choices made (with the user) where more than one valid approach existed,
and the one-line reason. Skip this section if there were none.>

- **Decision**: ... — **because** ...

## Open questions / assumptions

<Anything not fully resolved. Mark clearly as a question (needs an answer
before/while implementing) or an assumption (low-stakes, proceeding with
this unless told otherwise).>

- [ ] Question: ...
- Assumption: ...

## Phases

Each phase must be independently executable: it names the exact files it
touches and the state it depends on, so an agent can pick it up without
reading the earlier phases in full.

### Phase 1: <short name>

**Files touched**: `path/to/file.c`, `path/to/other.h`

**Depends on**: <prior state this needs, or "none">

**Steps**:
1. ...
2. ...

**Validate**:
- Run: `<exact build/test command>`
- Expect: <what success looks like>

### Phase 2: <short name>

**Files touched**: ...

**Depends on**: Phase 1 complete and validated.

**Steps**:
1. ...

**Validate**:
- Run: `<exact build/test command>`
- Expect: ...

<...repeat for remaining phases...>

## Definition of done

- [ ] All phases implemented and each individually validated
- [ ] <Task-specific criteria, e.g. "no new compiler warnings">
- [ ] <e.g. "existing tests/build still pass">
- [ ] <e.g. "docs/comments updated if behavior changed">
