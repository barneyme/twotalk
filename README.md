# Two Talk

> WRITE LESS, MEAN MORE

Two Talk is a semantic shorthand for notes - minimal, plaintext, and natively searchable. It is based on three simple concepts: 9 core symbols are paired to generate 81 semantic primes, which can then be compounded together with dots to form highly nuanced ideas in a concise form. The result is a highly compact, deterministic language designed to capture meeting context, project milestones, and rapid task updates in a single line.

**Why Two Talk?**
Keeping track of meeting notes, complex projects, and relentless task lists was the biggest bottleneck in my daily workflow. I needed a high-speed note-taking system that worked well in a keyboard-first environment to let me document everything that was going on. Writing full sentences was too slow to type and too dense to scan when searching for critical details. Unable to find an existing solution for my problem, I created Two Talk.

- Two Talk is keyboard-first and terminal-friendly. It allows you to log deep context with just a handful of strokes.
- Two Talk uses standard ASCII symbols, which means your files can live anywhere and on any OS. No app required. No vendor lock-in.

---

## Symbols

Each symbol stands for one basic category of meaning. These 9 categories are the building blocks - pair any two together and you get a predictable, consistent meaning.

| Symbol | Category   | Spoken |
|--------|------------|--------|
| @      | HUMAN      | An     |
| #      | OBJECT     | Ob     |
| !      | FORCE      | Ve     |
| ?      | IDEA       | Mo     |
| >      | OUT        | Ak     |
| <      | IN         | Li     |
| :      | TIME       | Ti     |
| ^      | PLACE      | Sa     |
| %      | MEASURE    | Me     |

---

## Matrix

The grid shows what every two-symbol combination means. To read it: find the first symbol in the left column, and the second symbol along the top row. Where they meet is the meaning.

| 1ST \ 2ND | @ HUMAN | # OBJECT | ! FORCE | ? IDEA | > OUT | < IN | : TIME | ^ PLACE | % MEASURE |
|------------|---------|----------|---------|--------|-------|------|--------|---------|-----------|
| @ HUMAN    | @@ I    | @# Who   | @! Feel | @? Is  | @> You | @< Have | @: Live | @^ Stay | @% We    |
| # OBJECT   | @# Body | ## What  | #! Tool | #? Word | #> Make | #< Part | #: Die  | #^ Be   | #% Some |
| ! FORCE    | !@ Want | !# Do    | !! Go   | !? Can  | !> Move | !< Refuse | !: Bad | !^ Rise | !% Very |
| ? IDEA     | ?@ See  | ?# Know  | ?! True | ?? Wonder | ?> Speak | ?< Else | ?: Why | ?^ Think | ?% One |
| > OUT      | >@ Say  | ># Work  | >! Give | >? Ask | >> Far | >< If | >: After | >^ Out | >% Big |
| < IN       | <@ Hear | <# Own   | <! Not  | <? Like | <> Other | << Stop | <: Before | <^ In | <% Small |
| : TIME     | :@ When | :# Now   | :! Soon | ?: Maybe | :> Will | :< Was | :: Long | :^ Old | :% Time |
| ^ PLACE    | ^@ Here | ^# This  | ^! Up   | ^? Where | ^> Side | ^< Down | ^: Near | ^^ Place | ^% Across |
| % MEASURE  | %@ Good | %# Much  | %! Most | %? May | %> More | %< Less | %: Two | %^ All | %% Same |

---

## Compounding

Compounding lets you stack symbols together to get more specific. Use dots (`.`) to join up to three pairs together: `XX.XX.XX`. Each pair modifies the one directly preceding it.

| Example   | Description                          | Result   | Type  |
|-----------|--------------------------------------|----------|-------|
| `@#`      | human + object                       | person   | NOUN  |
| `#!`      | object + force                       | tool     | NOUN  |
| `#! . ^?` | object + force, place + idea          | platform | NOUN  |
| `#! . ^? . !:` | object + force, place + idea, force + time | outage | NOUN  |

---

## Rules

**Order:** Write left to right: who → what → when. Words modify each other from left to right.
Example: `@! . >@ @? : #` = I communicated to you right now, `! : #! . ^?` = broken software.

**Topics:** Start a line with `##` to set the subject or context.
Example: `## @% [IBM] 2026-05-31` = tracking this organization.

**Sentences:** Each line is its own sentence.

**Negation:** Add `.<!` after a pair to negate it.
Example: `>!.<!` = no action / blocked. To negate a longer statement, break it into spaced words and place `<!` as a standalone word.
Example: `@! >: <! @% #^` = I will not contact this group.

**Questions:** Start with `>?` to ask a question.
Example: `>?.@% [LG] >^ : #` = Is the legal team still waiting?

**Tense:**
- `:<` = past
- `:>` = future
- `: #` = now
- For something ongoing, compound `::`
  Example: `>!.::` = process still running.

**Literals:** Use plain numbers for amounts (5), dates as `YYYY-MM-DD` (2025-04-14), times in 24hr (1430), and use initials for names and entities (JN, [LG]).

**Pronunciation:** Each symbol has a spoken sound:
- @ (An)
- # (Ob)
- ! (Ve)
- ? (Mo)
- > (Ak)
- < (Li)
- : (Ti)
- ^ (Sa)
- % (Me)

---

## Dictionary

### HUMAN
| Symbol | Meaning | Category |
|--------|---------|----------|
| @@     | I (myself, me, self) | HUMAN |
| @#     | Who (person, individual, human) | HUMAN |
| @!     | Feel (emotion, sense, experience) | HUMAN |
| @?     | Is (exists, equals, represents) | HUMAN |
| @>     | You (yourself, customer, recipient) | HUMAN |
| @<     | Have (possess, keep, hold) | HUMAN |
| @:     | Live (reside, survive, inhabit) | HUMAN |
| @^     | Stay (remain, wait, linger) | HUMAN |
| @%     | We (group, team, community) | HUMAN |

### OBJECT
| Symbol | Meaning | Category |
|--------|---------|----------|
| #@     | Body (anatomy, physical, framework) | OBJECT |
| ##     | What (object, item, asset) | OBJECT |
| #!     | Tool (contact, press, strike) | OBJECT |
| #?     | Word (category, type, sort) | OBJECT |
| #>     | Make (build, create, produce) | OBJECT |
| #<     | Part (component, fraction, element) | OBJECT |
| #:     | Die (perish, expire, cease) | OBJECT |
| #^     | Be (occurs, present, stands) | OBJECT |
| #%     | Some (several, partial, various) | OBJECT |

### FORCE
| Symbol | Meaning | Category |
|--------|---------|----------|
| !@     | Want (desire, wish, intent) | FORCE |
| !#     | Do (occur, transpire, unfold) | FORCE |
| !!     | Go (execute, perform, run) | FORCE |
| !?     | Can (able, capable, permits) | FORCE |
| !>     | Move (travel, shift, transfer) | FORCE |
| !<     | Refuse (deny, reject, decline) | FORCE |
| !:     | Bad (crisis, wrong, faulty) | FORCE |
| !^     | Rise (ascend, grow, increase) | FORCE |
| !%     | Very (highly, extremely, immensely) | FORCE |

### IDEA
| Symbol | Meaning | Category |
|--------|---------|----------|
| ?@     | See (view, observe, witness) | IDEA |
| ?#     | Know (understand, comprehend, recall) | IDEA |
| ?!     | True (valid, authentic, correct) | IDEA |
| ??     | Wonder (ask, query, doubt) | IDEA |
| ?>     | Speak (talk, discuss, conversing) | IDEA |
| ?<     | Else (otherwise, alternative, instead) | IDEA |
| ?:     | Why (since, reason, therefore) | IDEA |
| ?^     | Think (ponder, analyze, evaluate) | IDEA |
| ?%     | One (single, particular, sole) | IDEA |

### OUT
| Symbol | Meaning | Category |
|--------|---------|----------|
| >@     | Say (state, utter, tell) | OUT |
| >#     | Work (task, perform, accomplish) | OUT |
| >!     | Give (deploy, force, promote) | OUT |
| >?     | Ask (text, phrasing, vocabulary) | OUT |
| >>     | Far (route, ship, broadcast) | OUT |
| ><     | If (split, separate, detached) | LOGIC |
| >:     | After (following, subsequent, post) | OUT |
| >^     | Out (depart, leave, proceed) | OUT |
| >%     | Big (large, massive, extensive) | OUT |

### IN
| Symbol | Meaning | Category |
|--------|---------|----------|
| <@     | Hear (listen, register, perceive) | IN |
| <#     | Own (personal, private, interior) | IN |
| <!     | Not (negate, deny, exclude) | IN |
| <?     | Like (prefer, enjoy, favor) | SIMIL |
| <>     | Other (alternative, different, foreign) | IN |
| <<     | Stop (halt, cease, block) | IN |
| <:     | Before (prior, preceding, pre) | IN |
| <^     | In (inside, internal, inner) | IN |
| <%     | Small (minor, tiny, minimal) | IN |

### TIME
| Symbol | Meaning | Category |
|--------|---------|----------|
| :@     | When (schedule, clock, period) | TIME |
| :#     | Now (current, immediately, presently) | TIME |
| :!     | Soon (instant, flash, second) | TIME |
| :?     | Maybe (shortly, upcoming, imminent) | TIME |
| :>     | Will (subsequent, ahead, upcoming) | TIME |
| :<     | Was (past, earlier, historic) | TIME |
| ::     | Long (constantly, perpetual, endless) | TIME |
| :^     | Old (extended, lengthy, distant) | TIME |
| :%     | Time (during, span, interval) | TIME |

### PLACE
| Symbol | Meaning | Category |
|--------|---------|----------|
| ^@     | Here (local, nearby, present) | PLACE |
| ^#     | This (specific, indicated, identified) | PLACE |
| ^!     | Up (over, superior, upper) | PLACE |
| ^?     | Where (aspect, edge, flank) | PLACE |
| ^>     | Side (distant, remote, isolated) | PLACE |
| ^<     | Down (under, beneath, lower) | PLACE |
| ^:     | Near (indoor, interior, enclosed) | PLACE |
| ^^     | Place (location, coordinate, venue) | PLACE |
| ^%     | Across (span, transverse, cross) | PLACE |

### MEASURE
| Symbol | Meaning | Category |
|--------|---------|----------|
| %@     | Good (positive, quality, excellent) | MEASURE |
| %#     | Much (numerous, multiple, plenty) | MEASURE |
| %!     | Most (maximum, majority, highest) | MEASURE |
| %?     | May (perhaps, possibly, potential) | MEASURE |
| %>     | More (extra, plus, further) | MEASURE |
| %<     | Less (scarce, rare, handful) | MEASURE |
| %:     | Two (double, repeat, dual) | MEASURE |
| %^     | All (entirely, complete, full) | MEASURE |
| %%     | Same (identical, equal, uniform) | MEASURE |

---

## Meeting Note Example

### ENGLISH
John flagged a threat. Legal team response is pending.

### TWO TALK
```
JN >@.!:
@%.^? >!.<!
```

**Line 1:** `JN` (Literal name) `>@.!:` (state + crisis) `:<` (past).
**Line 2:** `@%.^?` (group + context/legal) `>!.<!` (execution + negation/blocked) `::` (ongoing).

---
## Start Learning Two Talk

Four steps to learn Two Talk. Start with the symbols, then build up to writing full sentences.

1. **Learn the 9 symbols.**
   These are the building blocks for everything else: `@ # ! ? > < : ^ %`

2. **Learn the 81 pairs.**
   Any two symbols combined make a word with a fixed meaning.
   Example: `#!` (tool), `@#` (person).

3. **Compound pairs with a dot.**
   Join up to three pairs to deeply nest meanings: `XX.XX.XX`. Left pairs are modified by right pairs.

4. **Write sentences.**
   One line per statement: who → what → when. Separate each word with a space.

---
## Top 25 Useful Pairs

These are the 25 most useful pairs optimized for notes, tasks, and status.

| #  | Symbol | Meaning                     |
|----|--------|-----------------------------|
| 1  | @@     | Self                        |
| 2  | @#     | Someone                    |
| 3  | @%     | People                     |
| 4  | >#     | Do / Action                |
| 5  | >!     | Execution                  |
| 6  | >>     | Progression                |
| 7  | #!     | Tool                       |
| 8  | #?     | Sign / Code                |
| 9  | <!     | Not / Blocked              |
| 10 | !!     | Done / Perfect             |
| 11 | !:     | Crisis / Bad               |
| 12 | !?     | Can / Able                 |
| 13 | !@     | Motive / Intent            |
| 14 | ??     | Wonder / Ask               |
| 15 | ?#     | Fact / Datum               |
| 16 | ?!     | Knowledge                  |
| 17 | ?^     | Context                    |
| 18 | %^     | All / Entire               |
| 19 | !>     | Move / Speed               |
| 20 | >@     | Speech / Say               |
| 21 | ><     | If                         |
| 22 | ::     | Duration                   |
| 23 | :<     | Past                       |
| 24 | :>     | Future                     |
| 25 | :#     | Now

---
Two Talk. © 2026. Barney Matthews.
````
