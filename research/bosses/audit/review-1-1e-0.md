# Phase 1.1E-0 independent planning review

**PASS WITH CAVEATS. Accept Phase 1.1E-0 as a planning batch.** The register totals, priority partition, pending-record list and OldNet corrections reconcile. Two previously identified access questions need explicit tracking. Several evidence descriptions and closing instructions need qualification before the affected work packages can be signed off. Phase 1 remains open.

Reviewed `a66ec5fd746ea5a54055f003892aeae56e243b58` against parent `c9a98ece4e5dc53fb23691e49cdceb64e7bf8ebf`. The six-file change is confined to research. I parsed the committed Markdown tables, CSVs and catalogue and compared their identifiers and references. [Register](caveats-register.md) · [Completion plan](census-completion-plan.md) · [Checkpoint](checkpoint.md)

## Register accounting and evidence

There are 32 unique IDs, BC-001 through BC-032. The published rows comprise **25 OPEN, 1 BLOCKED (BC-020), 6 RESOLVED and 0 ACCEPTED LIMITATION**. The 26 outstanding rows break down as follows.

| Severity | Unverified behavior | Proven defect | Documentation correction | Optional improvement | Total |
|---|---:|---:|---:|---:|---:|
| High | 10 | 0 | 0 | 0 | 10 |
| Medium | 10 | 2 | 0 | 0 | 12 |
| Low | 0 | 0 | 3 | 1 | 4 |

These are counts of register rows. Several rows group multiple encounters or observations. BC-001 covers the overall census and BC-024 covers shared runtime evidence. BC-011 concerns intended registration scope, BC-014 concerns independent encounter identity, and BC-019 concerns upstream Entropy spawns. Their overlap permits one capture to serve several decisions. Close a grouped row only after each named case has a disposition.

All six resolved rows have support within their stated scope. BC-026 is the independently verified 1.1A erratum. BC-027 resolves interpretation of settled filter samples and historical wording. The transient draw exception remains an observation. BC-028 resolves supplied-item use and resulting NPC identities under both replacement settings. BC-006 still carries acquisition. BC-030 covers the three D-C documentation fixes, BC-031 the OldNet wording, and BC-032 publication of the missing register. BC-007, BC-013 and BC-029 correctly retain the remaining focused-document edits. [A re-review](review-1-1a-recheck.md) · [B review](review-1-1b.md#minor) · [C review](review-1-1c.md) · [D-D review](review-1-1d-d.md#required-corrections-and-closure)

**BC-005 and BC-022 are correctly classified as medium-severity proven defects.** Fables requests two obsolete 13-argument suppression hooks against a seven-argument Calamity method. The pinned result supports KEEP ALL FOUR under both settings. Require a recorded decision on the obsolete integration, preserving all four entries. For Overhaul, the reflected type `BossChecklist.WorldAssist` is absent. The tracking array belongs to `BossChecklist.Systems.RecordSystem`. Its attempted clear cannot reach the array. BC-023 separately carries the high-priority uncertainty about records, kill credit, saved flags and multiplayer state. Require a reviewed impact assessment and explicit disposition for BC-022, with regression evidence if a repair is authorized. Neither defect can disappear from the final decision merely because the batch passed. [Duplicate-access review](review-1-1c.md) · [Overhaul compatibility review](review-1-1d-d.md#old-duke-and-supreme-calamitas)

## Required planning corrections

1. **Track Dreadnautilus and Primordial Wyrm access explicitly.** The final paragraph of the 1.1B review leaves ordinary access to all three Infernum-listed encounters open. BC-002 and E1 name only Bereft Vassal for access. BC-024 covers the D-series. Expand an existing row or add a linked access item for the other two. Carry forward the established Blood Moon fishing and Calamity Wyrm routes, the finalized Infernum keys and their tested availability. Record a normal-route observation only if required for an accessibility claim. An independently accepted static-only limitation is sufficient otherwise. Neither case adds a pending catalogue record. [B review](review-1-1b.md#what-the-registrations-establish) · [A re-review](review-1-1a-recheck.md) · [Inventory](encounters.csv)
2. **Correct two unsupported premises.** BC-009’s cited evidence establishes the Sir Nautilus key, named book row and buried-chamber hint. It does not document a traced dialogue chain or shared hit pool. Supply a specific evidence reference or mark those details unverified. E1 should likewise determine whether WoTM edits Boss Rush before the Checklist pass attributes a roster contribution to it. The retained WoTM row identifies an Ares hand and a Checklist integration. Hunt’s roster edit is independently established. [Runtime report](runtime-1-1b.md) · [Coverage matrix](mod-coverage.csv) · [Hunt review](review-1-1d-b.md#compatibility-and-limits-of-acceptance)
3. **Qualify LOW batch exits.** LOW is a reasonable scheduling priority, but its blanket “no positive encounter lead” wording overlooks the retained Checklist literal candidate in `CalamityModMusic.Load`. ClamExtraMusic, Munchies_CalamityAddon and CalamityMagicStorage also carry preliminary integration classifications. In E7, cite the retained evidence that bounds each such effect. For the music literal, distinguish an entry or membership change from metadata or a harmless lookup. Inspect only that call if existing evidence cannot distinguish them. A literal or broad classification alone proves no boss or defect. The priority totals can stand. [Coverage matrix](mod-coverage.csv) · [Plan](census-completion-plan.md#static-census)
4. **Make the Fables count decision explicit in E3.** Both Fables rows remain candidates parented to their Calamity namesakes. The four distinct spawned identities are already verified. Record which confirmed ID, if any, represents each fight and show the count delta under the adopted grouping rule. A name match or the current parent field alone cannot justify folding two playable fights together. Reuse 1.1C evidence. This review makes no inventory adjustment. [Inventory](encounters.csv) · [C review](review-1-1c.md)
5. **Repair BC-010’s evidence link.** The Stars review heading uses singular “registration”. The current fragment uses plural “registrations”. The substantive phase-membership finding is supported. [Correct section](review-1-1d-a.md#native-registration-and-npc-membership)

## Inventory, batch scope and OldNet

At both revisions the inventory has **180 distinct IDs** comprising 157 confirmed groups, 13 pending records, 4 candidates, 4 excluded helpers and 2 event tiers. Only OldNet’s route, prerequisites, evidence and notes changed. The catalogue and coverage matrix have identical blobs across the two commits. Expanding the inventory’s catalogue fields reproduces all 135 original owner/NPC pairs with matching multiplicity. The two other candidates alongside the Fables rows are THE LORDE and Permafrost. [Inventory](encounters.csv) · [Original catalogue](../encounter-catalogue.json)

The plan’s pending table matches the inventory exactly by owner and internal name. Its grouping also makes the proposed evidence efficient.

| Batch | Pending NPCs | Bounded decision |
|---|---|---|
| E1 | Infernum AresEnergyKatana, BereftVassal and WoTM AresHand | Trace each Ares actor to its owner/parent and compare to the already-grouped Crossmod hand. Resolve the Vassal trigger and Great Sand Shark relationship using the existing finalized-key observation. |
| E2 | CalValEX Fogbound and Meldosaurus, UnofficialCalamityWhips ScraperOfStarsHead | Identify initial spawn, content gate and outcome. Follow the Scraper segments to their head. |
| E3 | CalamityFables SirNautilus | Establish eligible chamber interaction and duel start. The book observation already exists. |
| E4 | Entropy AbyssalWraith, SpiritFountain and VoidPope | Check upstream cultist population, initial Fountain spawn and Pope/event initiation respectively. Preserve the established projectile, ring and hand relationships. |
| E4 | Overhaul DeepGaolWraith, FoundryOverseer and Undrowned | One supported Dungeonworld entry would serve all three room fights. The separate precursor and kill-record evidence already exists. A documented search boundary can support a pending disposition. |

The 58 preliminary mod IDs appear exactly once across **10 HIGH, 12 MEDIUM and 36 LOW**. None of the 13 targeted-static rows entered that partition. E1–E4 cover the pending records and share dependencies. E5 groups Thorium-facing integrations, E6 checks pack and Calamity hooks after their dependencies, and E7 addresses residual rare enemies, events and low-priority scope. Delirium, Void Invasion, the Funeral Cortege and the three Stars Above NPC leads have bounded identity or trigger questions. Everlasting Light and Warden retain their existing confirmed IDs. With the LOW qualification above, these exits can be reviewed without a general rescan. [Plan](census-completion-plan.md#static-census)

The Overhaul report, focused CSV and inventory agree on both single-player entry routes. The alternate route requires active layer-three Cyberspace, a local unmounted player outside subworlds and Down held for 120 ticks. Crossing noise tier four starts cleanup. Dispatch requires 2,700 ticks of continuous active cleanup. Before dragnet lock, noise below 60 cancels cleanup and resets the timer. Terminal presence, layer-three eligibility and practical access in existing worlds remain unverified. The checkpoint records the accepted D-D verdict. [Overhaul report](overhaul-1-1d-d.md) · [Matrix](overhaul-1-1d-d.csv) · [D-D review](review-1-1d-d.md#oldnet-and-dungeonworld-access)

## Closure decision

Each high-severity row identifies evidence or an action sufficient for an independent decision.

| High-severity IDs | Evidence needed for disposition |
|---|---|
| BC-001, BC-002, BC-020 | Per-mod scope and positive-lead dispositions, Ares parent and Vassal trigger, and a supported Dungeonworld caller or independently reviewed boundary on ordinary entry. |
| BC-010, BC-012 | Finalized Stars Above actor membership and phase tracking, plus eligible existing-save event timing, subworld transfers and persisted clears. Limit multiplayer work to supported, material claims. |
| BC-015, BC-016, BC-017 | Final Boss Rush roster and spawn mapping, ordinary versus absorbed Astrageldon credit, and a first-access disposition for Astrageldon and Goozma. Distinguish Astrageldon’s pre-Moon Lord first-clear opportunity from a repeat summon after unlock. |
| BC-018, BC-023 | Effective Inheritance settings and original/legacy flags at the relevant milestones. Compare native Old Duke and Supreme scenario despawns with kill controls and persisted state. |

The four milestone definitions are usable. **AUDIT BATCH ACCEPTED** records a scoped independent verdict. **CENSUS COVERAGE COMPLETE** requires a disposition for every scoped question and reconciled inventory, including justified unresolved cases. **CAVEAT RESOLUTION IN PROGRESS** tracks remaining tests, fixes and decisions. **PHASE 1 CLOSED** requires coverage completion, explicit disposition of both proven defects, independent review of major risks, acceptance of residual limitations and documented closure approval. A blocked runtime test can have an evidence-backed limitation. It cannot silently count as successful access.

Owner-label implementation, every optional shop or ambient route, repeated 1.1B book checks, unsupported multiplayer scenarios and exhaustive library decompilation need no place on the critical path. The five documentation and planning corrections above can be carried into authorized edits before their affected scopes close. **Accept 1.1E-0 with caveats. Phase 1 remains open.**
