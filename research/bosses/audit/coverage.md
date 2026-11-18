# Phase 1.1A encounter inventory

This pass covers the built-in Boss Checklist register, the Calamity, Thorium and Fargo’s Souls registration paths, and selected vanilla and integration encounters beyond those registers. The full 71-mod inventory is preliminary. No game session or Boss Checklist book was opened.

| Scope | Confirmed distinct rows | Evidence boundary |
|---|---:|---|
| Terraria 1.4.4.9 | 66 | Complete built-in registration list plus selected special encounters and rare enemies. The rare-enemy and event sweep remains open. |
| CalamityMod 2.2.4 | 34 | Full own registration methods, plus targeted NPC and overlap review. Acid Rain is one event family with three registered tiers. |
| ThoriumMod 1.7.2.8 | 14 | Full own register and dummy disposition. Other rare enemies and event behavior remain open. |
| FargowiltasSouls 1.7.3.9 | 16 | Full own registration method. Several access gates and related integrations remain open. |
| FargosSoulsModDLCRecreated 0.49 | 1 | Echdeath spawn hook reviewed. Other content is preliminary. |
| **Total** | **131** | Distinct encounter or event-group rows. Includes event objectives such as the four Lunar Pillars, which are identified separately from the enclosing event. |

The [encounter CSV](encounters.csv) also includes two Acid Rain tier rows, four candidate rows, four excluded helper or dummy rows and 44 pending catalogue records. All 135 original records across 16 namespaces are linked exactly once in the `catalogue_records` column. [Original catalogue](../encounter-catalogue.json)

## Reading registration status

| Value | Evidence |
|---|---|
| `CONFIRMED_REGISTERED` | The specified register declares the entry and the audit found no entry-specific availability predicate. |
| `CONDITIONAL_REGISTRATION` | The specified register declares the entry with an entry-specific availability predicate. The current rows in this category all use callbacks evaluated after registration. |
| `CONFIRMED_ABSENT_FROM_REGISTRATION` | The scoped register has no standalone entry, as stated in `registration_scope`. An event pool or an external mod may still cover the NPC. |
| `POSSIBLE_DUPLICATE_REGISTRATION` | Two pinned source paths target equivalent encounter labels. Simultaneous registration or display remains unverified. |
| `UNVERIFIED` | Registration is unresolved, including helpers where a separate entry would be unexpected. |

Within the original **131 confirmed rows**, **94** have a declaration without an identified entry-specific availability predicate, **8** have a declaration with a predicate, **28** lack a standalone entry in the specified register, and **1** has unresolved registration. The two extra Acid Rain tier rows carry predicates and sit outside this total. Additional registrar evidence does not change the original scopes or the denominator. [Encounter inventory](encounters.csv) · [Independent review](review-1-1a.md)

Boss Checklist creates the entry from the initializer or a registration call, then stores and evaluates the availability predicate separately. Display also depends on filtering and world state. The supplied preset sets `ProgressiveChecklist` to true. All 185 in-game visibility fields remain `UNVERIFIED`. [Pinned preset](../../../modpack/presets/ModConfigs/BossChecklist_BossLogConfiguration.json)

- `registration_key` contains the canonical `Owner InternalName` key for the scoped standalone declaration. `registration_initializer_argument` preserves the raw vanilla argument before `EntryInfo.MakeVanillaBoss` or `MakeVanillaEvent` normalizes it. For example, `NPCName.EaterofWorldsHead` resolves to `Terraria EaterofWorlds`.
- `availability_predicate` records the scoped callback. `additional_registration_evidence` records additional pinned declarations or leads alongside the original scoped result. `checklist_event_relationship` records event NPC pool membership, event limbs or a documented natural-spawn association. The kind is identified in each populated field.

## Reproducing the static checks

1. Use the [71-mod lock](../../../modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json). Verify each local package against its locked SHA-256 and internal TMOD name/version, using `modpack/lib/TmodInspector.cs` as a format and verification reference. Read each package’s file table and extract only its own named DLL plus relevant English localization to temporary storage. The audit verified all 71 packages and read all 71 assemblies statically. Local package or decompiled content is outside this repository.
2. Enumerate assembly type definitions and base types in PE metadata. Resolve the visible inheritance chains to `Terraria.ModLoader.ModNPC`. Count direct `GlobalNPC` subclasses separately. These are type counts, including abstract classes and helpers. The matrix provides the locked hash, catalogue count, example types, and candidate method names where applicable. A literal IL search for `BossChecklist`, current/legacy registration messages, and `GetBossInfo` was a shortlist for decompilation. It cannot prove absence or find every dynamically formed call. [Coverage matrix](mod-coverage.csv)
3. In BossChecklist 2.2.4, inspect `BossTracker.InitializeVanillaEntries`, `BossChecklist.Call`, and `BossTracker.FinalizeEntryData`. The current dispatch accepts `LogBoss`, `LogMiniBoss` and `LogEvent`. The finalize path also maps legacy `Add*` calls. Event NPC pools, related entries and standalone registrations are different relationships. Cross-check the vanilla numeric IDs against `Terraria.ID.NPCID` in the matching tModLoader assembly. Use version-appropriate official wiki details only for access and encounter context. [tModLoader release](https://github.com/tModLoader/tModLoader/releases/tag/v2026.09.3.1) · [Vanilla bosses](https://terraria.wiki.gg/wiki/Bosses) · [Vanilla events](https://terraria.wiki.gg/wiki/Events) · [Vanilla enemies](https://terraria.wiki.gg/wiki/Enemies)
4. In the pinned mods, inspect the methods named in the CSV. Calamity’s `WeakReferenceSupport` registers bosses, minibosses and the Acid Rain tiers and Boss Rush. Thorium’s `BossChecklistSupport` gates its own calls on API version 1.6 or later, which the pin meets. Fargo’s `BossChecklistCompatibility` forms its API message dynamically from `Log` plus the category, so scanning only for a literal `LogBoss` would miss it. The integration metadata’s spawn-item fields are hints. Their presence does not prove that an item summons an event participant directly, or establish all use and spawn gates.

The catalogue SHA-256 is `B3962BA5EF7D9B81377C2BE7FA5A11CCAFCA48BBE2D0D9D4B3F8750AA52BE04D`. The lock SHA-256 is `8D31E373727D4AE75BB6FC4AFA247B0C7DEB00D18F7B8279E828B60BF4645CC6`. The local tModLoader assembly reported Terraria `1.4.4.9` and tML `2026.09.3.1`, SHA-256 `BF2CA4D53512D064FAE664170A0D21ECC5E2ED51B5E917D871EC78CC449263E9`.

## Grouping and preliminary gaps

- Calamity’s Exo Mechs share one entry. Ares weapons and Thanatos segments are associated with that row. Anahita and Leviathan are paired. Desert Scourge, Astrum Deus, Storm Weaver and Devourer of Gods are grouped by encounter. Calamity’s Brain Illusion and False Brain are attached to the vanilla Brain of Cthulhu as helpers.
- Thorium’s Borean Strider, Fallen Beholder, Lich and Forgotten One each include multiple NPC forms in one entry. Dream Eater, Slag Fury, Omnicide and Aquaius share the Primordials entry. `BossDummy` inherits `AggroDummy` and sets the boss flag. It is excluded as a training helper. Thorium’s Patch Werk, Corpse Bloom and Illusionist were recovered from the pinned register despite their absence from the original catalogue.
- Fargo’s Terra Champion includes worm segments. Timber Champion’s head is associated with Timber. Crossmod’s Ares Hand belongs to the Exo Mechs family. Permafrost has its own NPC and spawns Cryogen and Archmage; its independent encounter classification remains a candidate. Echdeath is a separate special encounter with a verified Pandora’s Box hook and unresolved book registration.
- The built-in initializer has no standalone entry for Dreadnautilus, Mothron or Goblin Warlock. Blood Moon and Eclipse list NPCs 618 and 477 in their respective default pools. Goblin Army acquires NPC 471 from `NPCID.Sets.BelongsToInvasionGoblinArmy` during pool finalization. Patch Werk naturally spawns during Blood Moon under its own spawn conditions. Thorium declares a standalone miniboss entry for it. Its checklist event-pool membership remains unverified.
- The four Lunar Pillars are limbs of `Terraria LunarEvent`. The CSV keeps each objective's parent relationship and leaves its standalone key empty.
- Infernum 2.0.1.35 declares `InfernumMode Dreadnautilus` and `InfernumMode PrimordialWyrm` via dynamically constructed `LogBoss` calls in `BossChecklistManagementSystem.PostSetupContent`. Their availability callbacks require Infernum mode and Hardmode. The same method declares `InfernumMode BereftVassal` for the Vassal and Great Sand Shark, with Infernum mode and `NPC.downedAncientCultist` as its callback. Its catalogue disposition remains pending. The original vanilla and Calamity scope findings remain in the CSV.
- Echdeath's pinned Pandora’s Box hook requires Up and Down pressed and Left and Right released, along with the dependency and environmental checks listed in the CSV. Successful summoning and standalone book registration remain unverified. THE LORDE has a coded zenith-world spawn route through `Bohldohr.OnKill` and a summon-item implementation. Ordinary-world access remains unverified.
- Fables and Calamity declare separate keys for their respective Desert Scourge and Crabulon encounters. With replacement enabled, Fables looks for two private 13-parameter `AddBoss` overloads. The pinned Calamity version exposes one seven-parameter method, so those detours cannot attach. The effective setting, simultaneous registration in the running pack and simultaneous book visibility remain `UNVERIFIED`. Fables also declares `CalamityFables SirNautilus`. Its catalogue disposition remains pending.

## Coverage boundary

“Apparently adds no relevant encounters” is a preliminary screen outcome. An empty catalogue or a zero NPC count cannot rule out event logic, integration hooks, or external subclasses. The remaining snapshot records are individual candidate NPCs until grouping and reachability can be verified. The audit records no progression, drop, difficulty or balancing recommendations.
