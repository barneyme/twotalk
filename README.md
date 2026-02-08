# TWO TALK

**Concise Semantic Notation System**

---

## Introduction

Two Talk is a concise notation system for capturing meaning, not sentences. It uses small, fixed symbol pairs where each pair always means the same thing, and meaning comes from explicit context and composition rather than grammar. It provides a faster, more structured alternative to prose when accuracy and brevity are essential, whether you're logging project updates, documenting technical systems, or organizing research and knowledge.

Two Talk works in plain text and is designed to be shared, processed, and reread reliably. It is deterministic: the same notation represents the same state no matter who writes it. This makes it useful across roles and environments - from project coordination to system tracking to standardized observation - wherever consistency across people, platforms, and time matters.

### Examples

| Description | Two Talk |
|-------------|----------|
| The project timeline needs to be extended | `^^ ** #:` |
| The task is getting close to its deadline | `## :! :?` |
| The team is getting together right now | `@@ :*` |
| The construction site is a long way away from the office | `^* ^@ ^:` |

---

## The 12 Symbols

Master these 12 building blocks to generate any meaning in Two Talk.

| Symbol | Name | Meaning |
|--------|------|---------|
| `@` | **PERSON** | agent, individual, people |
| `#` | **THING** | object, resource, artifact |
| `:` | **TIME** | when, duration, timing |
| `^` | **PLACE** | where, space, location |
| `*` | **ACTION** | change, effort, motion |
| `"` | **INFO** | data, text, signal |
| `!` | **CERTAINTY** | truth, rule, confidence |
| `?` | **UNKNOWN** | question, doubt, possibility |
| `+` | **LARGE** | more, greater, expanded |
| `-` | **SMALL** | less, reduced, minor |
| `=` | **SAME** | stable, equal, aligned |
| `/` | **NONE** | absence, null, missing |

---

## Rules

- **Pairs:** Every word is a two-symbol pair.
- **Spacing:** Words are separated by spaces or line breaks. The dot (`.`) never counts as spacing.
- **Context (`**`):** Sets the current context. It applies until a new context is declared.
- **Dialect (`=^`):** Sets a local meaning inside the current context. It applies until a new context or new dialect is set.
- **Compounds:** Use a dot (`.`) to join pairs into a compound. Compounds read left to right.
- **Order:** Meaning is interpreted in this order: Context > Dialect > Pair > Compound > Word sequence.
- **Literals:** Use initials (JB, Q) for names or identifiers. Use numbers for quantities. Use ISO format for dates (YYYY-MM-DD).

---

## Quick Start Guide

Learn Two Talk in 6 steps.

### 1. What is Two Talk?

Two Talk is a concise semantic notation system that compresses meaning using two-symbol pairs. Each pair has exactly one golden canonical meaning. Grammatical role (object, idea, action) is not encoded - it emerges from context.

By learning just 12 base symbols and how they combine, you can express nearly anything with extreme brevity.

**Example:**

```
English: "The manager needs to review the budget report"
Two Talk: :@ *" #^
```

13 words → 3 symbol pairs → **77% shorter**

Same meaning. Less noise.

### 2. Learn the 12 Base Symbols

Each base symbol represents a semantic axis. These meanings never change.

- `@` PERSON (agent, individual, people)
- `#` THING (object, resource, artifact)
- `:` TIME (when, duration, timing)
- `^` PLACE (where, space, location)
- `*` ACTION (change, effort, motion)
- `"` INFORMATION (data, text, signal)
- `!` CERTAINTY (truth, rule, confidence)
- `?` UNCERTAINTY (question, doubt, possibility)
- `+` LARGE (more, greater, expanded)
- `-` SMALL (less, reduced, minor)
- `=` SAME (stable, equal, aligned)
- `/` NONE (absence, null, missing)

Two Talk words are formed as: **[category] + [modifier]**

Each resulting pair has one canonical meaning.

### 3. The Rules

- **Pairs:** Every word is a two-symbol pair.
- **Spacing:** Words are separated by spaces or line breaks. The dot (`.`) never counts as spacing.
- **Context (`**`):** Sets the current context. It applies until a new context is declared.
- **Dialect (`=^`):** Sets a local meaning inside the current context. It applies until a new context or new dialect is set.
- **Compounds:** Use a dot (`.`) to join pairs into a compound. Compounds read left to right.
- **Order:** Meaning is interpreted in this order: Context > Dialect > Pair > Compound > Word sequence.
- **Literals:** Use initials (JB, Q) for names or identifiers. Use numbers for quantities. Use ISO format for dates (YYYY-MM-DD).

### 4. Your First Two Talk Notation

**Translate:** "The team needs help"

1. **Identify meaning**
   - team → people acting together
   - help → support

2. **Choose symbol pairs**
   - `@@` → group
   - `*@` → support

3. **Drop filler**
   - Remove "the", "needs"

**Result:** `@@ *@`

### 5. Taking Meeting Notes

**Original meeting dialogue (87 words):**

> "We need to launch the new website by next Friday. The design team finished their work yesterday. Marketing will review the content today. The CEO wants a final demo on Thursday. Budget approval is still pending from finance."

**Two Talk notes (9 symbols):**

```
** ^"
*+ 2026-02-07
@@ :" =*
@" :: *"
@+ :? *"
#^ :?
```

**How to read:**

- `** ^"` → Context: website
- `*+ 2026-02-07` → expand / launch on Friday
- `@@ :" =*` → design group completed yesterday
- `@" :: *"` → marketing reviewing today
- `@+ :? *"` → authority wants demo Thursday
- `#^ :?` → capital approval pending

**Result:** ~90% shorter, same information, easier to scan later.

### 6. Real Example: Daily Standup

**Before (spoken update):**

> "Yesterday I completed the user authentication module and fixed three bugs in the payment system. Today I'm working on the dashboard API integration. I'm blocked on getting database credentials from DevOps."

**After (Two Talk):**

```
:" #^ =*
:" #- 3 *-
:: ^" **
!? #^ @^
```

**How to read:**

- `:" #^ =*` → yesterday: core system completed
- `:" #- 3 *-` → yesterday: 3 small fixes
- `:: ^" **` → today: dashboard context
- `!? #^ @^` → risk: blocked on infra team

**Result:** Your updates are recorded clearly. You spend more time building, less time explaining.

**Key idea:** Two Talk compresses meaning, not words. Canonical meaning is fixed. Context does the rest.

---

## Top 20 Two Talk Words

These 20 symbol pairs are enough to express roughly 80% of everyday notes - meetings, tasks, standups, and planning.

| Pair | Meaning | Pair | Meaning |
|------|---------|------|---------|
| `**` | context | `=^` | system |
| `@@` | group | `@+` | authority |
| `@*` | worker | `*"` | report |
| `*=` | maintain | `*/` | stop |
| `*+` | expand | `::` | now |
| `:"` | memory | `:!` | deadline |
| `:?` | pending | `#"` | document |
| `#^` | capital | `!!` | certainty |
| `!?` | risk | `=*` | process |
| `^@` | home | `/#` | nothing |

---

## Dictionary

Each symbol pair has one golden canonical meaning. Interpretation (object, idea, action) emerges from context and dialect.

### ! - CERTAINTY

| Pair | Canonical Meaning |
|------|-------------------|
| `!!` | certainty |
| `!+` | absolute |
| `!-` | failure |
| `!=` | verify |
| `!/` | false |
| `!:` | rule |
| `!?` | risk |
| `!@` | judgment |
| `!^` | secure |
| `!"` | evidence |
| `!#` | measure |
| `!*` | duty |

### " - INFORMATION

| Pair | Canonical Meaning |
|------|-------------------|
| `""` | text |
| `"+` | complex |
| `"-` | brief |
| `"=` | template |
| `"/` | hidden |
| `"!` | proof |
| `"?` | query |
| `":` | log |
| `"^` | link |
| `"@` | name |
| `"#` | number |
| `"*` | instruction |

### # - THING

| Pair | Canonical Meaning |
|------|-------------------|
| `##` | unit |
| `#+` | bulk |
| `#-` | scrap |
| `#=` | standard |
| `#/` | empty |
| `#!` | value |
| `#?` | unknown |
| `#:` | structure |
| `#*` | tool |
| `#"` | data |
| `#@` | asset |
| `#^` | resource |

### * - ACTION

| Pair | Canonical Meaning |
|------|-------------------|
| `**` | situation |
| `*+` | expand |
| `*-` | reduce |
| `*=` | maintain |
| `*/` | stop |
| `*!` | impact |
| `*?` | explore |
| `*:` | sequence |
| `*^` | grow |
| `*"` | signal |
| `*@` | support |
| `*#` | build |

### / - NONE

| Pair | Canonical Meaning |
|------|-------------------|
| `//` | reset |
| `/+` | deplete |
| `/-` | trace |
| `/=` | skew |
| `/!` | deny |
| `/:` | end |
| `/?` | hidden |
| `/@` | departed |
| `/^` | void |
| `/"` | silence |
| `/#` | nothing |
| `/*` | broken |

### : - TIME

| Pair | Canonical Meaning |
|------|-------------------|
| `::` | now |
| `:+` | future |
| `:-` | instant |
| `:=` | duration |
| `:/` | never |
| `:!` | deadline |
| `:?` | pending |
| `::` | now |
| `:*` | event |
| `:"` | record |
| `:@` | schedule |
| `:^` | cycle |
| `:#` | history |

### = - STABILITY

| Pair | Canonical Meaning |
|------|-------------------|
| `==` | identity |
| `=+` | duplicate |
| `=-` | reduce |
| `=/` | default |
| `=!` | fact |
| `=:` | routine |
| `=@` | align |
| `=#` | component |
| `=*` | process |
| `="` | copy |
| `=?` | alternate |
| `=^` | system |

### ? - UNCERTAINTY

| Pair | Canonical Meaning |
|------|-------------------|
| `??` | question |
| `?+` | potential |
| `?-` | doubt |
| `?=` | compare |
| `?/` | ignore |
| `?!` | choice |
| `?:` | pause |
| `?@` | stranger |
| `?^` | option |
| `?"` | logic |
| `?#` | mystery |
| `?*` | attempt |

### @ - PERSON

| Pair | Canonical Meaning |
|------|-------------------|
| `@@` | group |
| `@+` | authority |
| `@-` | junior |
| `@=` | peer |
| `@/` | absent |
| `@!` | identity |
| `@?` | unknown |
| `@:` | availability |
| `@*` | worker |
| `@"` | source |
| `@#` | body |
| `@^` | remote |

### ^ - PLACE

| Pair | Canonical Meaning |
|------|-------------------|
| `^^` | space |
| `^+` | region |
| `^-` | spot |
| `^=` | boundary |
| `^/` | distant |
| `^!` | point |
| `^?` | unknown |
| `^:` | distance |
| `^*` | target |
| `^"` | map |
| `^#` | base |
| `^@` | home |

---

## Credits

Two Talk was created by [Barney Matthews](https://barney.me).

Learn more at [twotalk.org](https://twotalk.org).
