# Phase 1.1B Boss Checklist runtime verification

**18 November 2026 · Terraria 1.4.4.9 · tModLoader 2026.9.3.1 · Boss Checklist 2.2.4 · single player**

All eight named Infernum, Calamity and Calamity Fables entries reached Boss Checklist’s finalized dictionary. The real book showed both Desert Scourges and both Crabulons with Fables replacement enabled and disabled. Sir Nautilus had its own visible entry. No standalone Echdeath entry was found. [Scenario and entry evidence](runtime-entries-1-1b.csv)

## Test setup and evidence

- Loaded a disposable copy of an existing 16,800 × 4,800 Titanic world, character and configs with the 71-mod package set. All 71 local SHA-256 values and loaded mod names and versions matched the lock. The tModLoader assembly hash matched Phase 1.1A. The lock lists 169,618 bytes for TitanWorlds, while the copied 1.15.16.1 package is 169,910 bytes and matches the lock’s SHA-256 exactly. The lock itself is outside the scope of this batch. [Pinned package lock](../../../modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json) · [Phase 1.1A digest record](coverage.md)
- The baseline launch reached the world with exactly 71 external packages. Later launches used those 71 plus one temporary client-only diagnostic. tModLoader also includes its own built-in ModLoader entry in the runtime mod array, yielding 73 objects in those launches. The probe checked the tracker’s finalized flag, called `GetBossInfoDictionary`, and read target NPC identities, availability delegates and live filtering results. Both launches with the probe returned 133 distinct finalized keys. The 133 refers to the loaded API dictionary and the static 131 refers to grouped encounter inventory.
- The probe opened the inventory when keyboard input did not reach the client reliably. The book was opened with its own inventory button. In the second instrumented launch, the probe also read the actual open Table of Contents row controls by key and used the live book setting to test Hide Unavailable off. The observations below come from navigating and viewing the real book, with the row controls used to identify same-name entries and check omission across the scrollable list. The CSV records availability and book visibility separately.
- The Pre-Hardmode case used the copied save’s original progression. The Hardmode and Cultist cases used disposable world-header variants with the named progression flags, retaining the existing world terrain. These exercise the book conditions without replaying Terraria progression. Infernum was enabled through Calamity’s normal difficulty selector, which selected its Expert backbone. The client reported that selecting Infernum disabled Eternity Mode. The Fargo’s Souls DLC compatibility warning appeared on world entry. No boss fights were needed.
- Tests used explicit save and mod directories. The audit package, saves, raw logs and local diagnostic source stay outside the repository. The probe did not register encounters or alter gameplay behavior. The research commit covers the audit only.

## Interpreting the book

Baseline book filters were Automatic Checklist on, Hide Unavailable on, Hide Unsupported off, Bosses Only off, all three categories set to Show, and the hidden-entry editor closed. Targeted entries were neither manually hidden nor completed or marked. With Progressive Checklist enabled, unfinished entries other than the next entry were shown as `???` when they passed the checklist filter. Their detail pages were locked. Turning off Progressive Checklist revealed the names. Turning off Hide Unavailable let the book show named gray rows whose availability callbacks still returned false. The CSV uses PRESENT for a named row, HIDDEN BY CONDITION for a filtered row or a masked name, ABSENT for a missing standalone entry, and UNVERIFIED when no specific book outcome was established.

## Fables replacement and duplicates

The initial launch with the diagnostic retained the copied configuration, which resolved to `CalamityFables.CalCompatConfig.ReplaceCalamity = true`. The next launch explicitly set it to false before loading because the option is reload-required. Both Fables suppression hook objects were null in both runs. With replacement enabled, Fables identified the Calamity Desert Scourge and Crabulon NPCs as replaced. With replacement disabled, those NPCs were outside that replacement list. The four entries survived in both launch configurations and used Boss Checklist’s default true availability. The pinned hook-signature mismatch in Phase 1.1A therefore leaves both Calamity registrations visible when replacement is on. [Static re-review](review-1-1a-recheck.md)

| Finalized key | Registrar | Book observation with names revealed | Gameplay access evidence |
|---|---|---|---|
| `CalamityMod DesertScourge` | Calamity `WeakReferenceSupport` | First Desert Scourge on the Pre-Hardmode page | Pinned Calamity summon code uses Desert Medallion in the Desert, with no existing head and Boss Rush inactive. Normal access with either replacement setting remains unverified. |
| `CalamityFables DesertScourge` | Fables `DesertScourge.AddToChecklist` | Second Desert Scourge on the same page | Static checklist hints point to Stormlion Larva, Dead Stormlion Larva or Bucket of Larvae. Normal access remains unverified. |
| `CalamityMod Crabulon` | Calamity `WeakReferenceSupport` | First Crabulon after scrolling the Pre-Hardmode page | Pinned Calamity summon code uses Decapodita Sprout in an underground Glowing Mushroom biome, with no active Crabulon and Boss Rush inactive. Normal access with either setting remains unverified. |
| `CalamityFables Crabulon` | Fables `Crabulon.AddToChecklist` | Second Crabulon on the same scroll | Entry hints point to a natural appearance in Mushroom caves or using a Hookstaff on mushroom grass. Normal access remains unverified. |
| `CalamityFables SirNautilus` | Fables `SirNautilus.AddToChecklist` | Named row near the top of the Pre-Hardmode page between Giant Clam and Eye of Cthulhu | Entry points to the lone soldier’s buried chamber. Chamber access and starting the duel remain unverified. |

These are duplicate **labels**, backed by distinct keys and different NPC identities. The replacement-on result is a checklist suppression failure for both Calamity rows. Whether both rows describe reachable fights with replacement off, or a Calamity fight remains reachable with replacement on, requires normal-route testing. Sir Nautilus has a different NPC and no shared key or NPC ID with Infernum Dreadnautilus. All five Calamity and Fables rows have runtime entry type Boss, including Sir Nautilus.

## Echdeath

No finalized entry matched `Echdeath` in the canonical key, localized name or registered NPC identities, and the open Table of Contents with both progression masking and the availability filter disabled had no standalone Echdeath row. The result is scoped to these launches of the pinned pack.

Phase 1.1A verified the summon hook’s prerequisites. Fargo’s Souls DLC must be loaded. Use Pandora’s Box during a Solar Eclipse at moon phase 0 with an active Dungeon Guardian (68), floor tile 409, wall 87 and a nearby EchPaintingSheet. Hold Up and Down with Left and Right released. The spawn branch runs in single player or on the server. Successful summoning remains **UNVERIFIED**. [Verified static prerequisites](review-1-1a-recheck.md)

## Infernum registration, availability and display

Infernum’s `BossChecklistManagementSystem.PostSetupContent` registered all three as Boss entries under its own key prefix, even with Infernum mode off. `CanUseCustomAIs` reported the effective mode in the loaded world.

| Canonical key | NPCs supplied | Availability callback | Named book observation |
|---|---|---|---|
| `InfernumMode Dreadnautilus` | Terraria BloodNautilus (618) | Infernum active and Hardmode | In Hardmode with Infernum on, the row appeared between Fallen Beholder and Queen Slime in the right-hand list. With Infernum off, those two rows were consecutive. The finalized `Terraria BloodMoon` event still included NPC 618 in its pool. |
| `InfernumMode PrimordialWyrm` | Calamity’s PrimordialWyrmHead | Infernum active and Hardmode | With Infernum active in Hardmode, scroll near the bottom of the right-hand list. The Wyrm appeared between Cruiser and Abominationn. |
| `InfernumMode BereftVassal` | Infernum’s BereftVassal and Calamity’s GreatSandShark | Infernum active and Cultist defeated | Before Cultist, Hide Unavailable omitted it. With the filter off, it appeared gray below Great Sand Shark. In the corrected Cultist case, the book showed a completed Lunatic Cultist and the available Vassal below Great Sand Shark, with Hide Unavailable on again. |

`CalamityMod GreatSandShark` also finalized as a separate MiniBoss and appeared by name. It shares an NPC identity with the Vassal registration. The standalone Dreadnautilus and Blood Moon event also share an NPC identity. The two Fables pairs instead share labels while each row has its own NPC identity.

## Scenario ledger

| CSV scenario | Effective world and settings | In-game observation |
|---|---|---|
| BASE | 71 external packages, original Pre-Hardmode Titanic progression | Entered the world. Target inspection took place in the two instrumented launches. |
| ON-PRE-PROG | Pre-Hardmode, Infernum off, replacement on, Progressive Checklist on | The book drew unfinished, non-next rows as `???`. The live checklist and detail gates identify which target names were masked. |
| ON-PRE-NAMES | Same world and mod settings, Progressive Checklist off | The top of the left list showed both Desert Scourges and Sir Nautilus. A short downward scroll displayed both Crabulons. |
| OFF-HM-NOINFERNUM-FILTER | Hardmode, Cultist undefeated, Infernum off, replacement off, Hide Unavailable on | Both duplicate pairs and Sir Nautilus remained. The open Table of Contents omitted the three Infernum rows. |
| OFF-HM-INFERNUM-FILTER | Same progression, Infernum enabled through the difficulty selector | Dreadnautilus and Primordial Wyrm appeared. Bereft Vassal stayed filtered out. |
| OFF-HM-INFERNUM-SHOWALL | Same world, Hide Unavailable off | Bereft Vassal appeared gray below Great Sand Shark with availability false. No Echdeath row was found. |
| OFF-CULT-INFERNUM-FILTER | Hardmode, Cultist defeated, Infernum on, replacement off, Hide Unavailable on | The open book contained all three named Infernum rows. Bereft Vassal appeared as available. |
| OFF-PRE-NOINFERNUM-FILTER | Original Pre-Hardmode progression, Infernum off, replacement off, Hide Unavailable on | The same named duplicate pairs and Sir Nautilus appeared in the matched comparison against ON-PRE-NAMES. |
| OFF-PRE-INFERNUM-FILTER | Same Pre-Hardmode copy, Infernum enabled through the difficulty selector | The open book omitted all three Infernum rows. Their dictionary keys remained present and availability callbacks stayed false. |

The first attempted Cultist variant still reported `NPC.downedAncientCultist = false`. The offline parser read the NPC kill-count length as 32 bits instead of 16, shifting the edit by two bytes. The audit restored the neighboring flag from the original copy, set the correct flag, and reloaded the disposable save with Infernum already saved through the normal selector. The Cultist-defeated conclusion uses the verified `true` reading.

## Open questions and next review

Normal access and positive summon results for both Calamity/Fables pairs, the Sir Nautilus duel, the three Infernum encounters, and Echdeath remain unverified. The static 135-NPC mapping, 131 encounter groups and scoped registration counts remain the Phase 1.1A baseline. The runtime results concern the targeted batch of the pinned pack. [Encounter inventory](encounters.csv) · [Static coverage](coverage.md)

The next action is independent review using GPT-6.2 Astra with High thinking. After review, exercise each Desert Scourge and Crabulon through its normal summon route with replacement on and off, recording the spawned NPC identity. [Checkpoint](checkpoint.md)
