# Phase 1.1D-A independent review — The Stars Above 2.1.8.4

**PASS WITH CAVEATS. Accept the static census of nine bosses and one world event.** All nine bosses have native Boss Checklist declarations. Everlasting Light has no native event declaration. The three additional NPC leads remain outside the confirmed total. Two access-route details need clarification, neither of which changes an encounter identity, key or count. [Audit report](starsabove-1-1d.md) · [Encounter matrix](starsabove-1-1d.csv)

## Census and integrity

I compared audit commit `59c8205c314d4f724be91fc7549667167b1d8b9b` with its parent `7c115436013041f346efc0732ae563138c0107ae` and parsed both versions of the inventory. The 12 Stars Above snapshot NPC names occur exactly once across the nine new boss rows. Six bosses contribute one NPC each. The twin fight and two successive-phase fights contribute two each. Everlasting Light has its own timer, saved state and world effects. Its preview and active stages account for one additional event. [Original snapshot](../encounter-catalogue.json) · [Maintained inventory](encounters.csv)

| Inventory measure | Parent | Reviewed commit |
|---|---:|---:|
| Confirmed encounter or event groups | 131 | 141 |
| Pending catalogue records | 44 | 32 |
| Event tiers / candidates / excluded helpers | 2 / 4 / 4 | 2 / 4 / 4 |
| Total rows | 185 | 183 |

All 183 inventory IDs are unique. All non-Stars Above inventory records match the parent across every field, including the 131 prior confirmed groups. The original catalogue has the same Git blob in both commits (`e1e2ff476f100be58ea2c8ef972990279fa895a7`). Of the five changed research files, two are the new report and matrix. The coverage change affects only Stars Above and marks it `TARGETED_STATIC`. The checkpoint preserves the historical counts and records the approved 1.1C verdict. [Coverage matrix](mod-coverage.csv) · [Checkpoint](checkpoint.md)

The focused CSV has ten confirmed rows and three candidate-only rows. I counted 48 ModNPC descendants and 14 direct GlobalNPC types in the retained Stars Above type table. The spawn pools in `StarsAboveSubworldNPC.EditSpawnPool` and `StarsAboveGlobalNPC.EditSpawnPool` support ambient Paracausal Enigma and Asteroid Worm encounters. The worm head selects its body and tail types. The retained C# contains the Spectre of Light definition and its Sea of Stars bestiary association, but I found no native summon or spawn-pool assignment for it. None of these three qualifies as an independently confirmed miniboss on the available evidence. Arena walls, the Garden of Avalon attack helper, and the Logic Virus's bomb payload also lack evidence of independent fights. [Candidate records](starsabove-1-1d.csv#L12)

## Native registration and NPC membership

The retained `StarsAbove.tsv` identifies nine `LogBoss` literals in `StarsAbove.PostSetupContent`. I checked the arguments in `StarsAbove/StarsAbove.cs` lines 253–443 against all nine CSV records. Each call passes the Stars Above mod instance. Boss Checklist's dispatcher passes its internal name and NPC list to `BossTracker.AddEntry`. The canonical keys below share the literal prefix `StarsAbove ` (including the space). The numbers are the original snapshot IDs. [Audit key table](starsabove-1-1d.md#native-boss-checklist-calls)

| Key suffix | Native NPC argument | Completion flag | Availability |
|---|---|---|---|
| VagrantBoss | VagrantBoss 1538 | downedVagrant | Default |
| ThespianBoss | ThespianBoss 1533 | downedThespian | Default |
| PolluxBoss | PolluxBoss 1505 | downedDioskouroi | Default |
| PenthesileaBoss | PenthesileaBoss 1528 | downedPenth | Default |
| StarfarerBoss | StarfarerBoss 1531 | downedStarfarers | Penthesilea and Plantera cleared |
| NalhaunBossPhase2 | NalhaunBossPhase2 1508 | downedNalhaun | Default |
| ArbitrationBoss | ArbitrationBoss 1502 | downedArbiter | Default |
| WarriorOfLightBoss | WarriorOfLightBossFinalPhase 1544 | downedWarrior | Default |
| TsukiyomiBoss | TsukiyomiBoss 1537 | downedTsuki | Warrior cleared |

Both availability delegates are passed in the metadata of calls made whenever Boss Checklist is found. Read the CSV status `CONDITIONAL_REGISTRATION` here as an entry with conditional **availability**. Starfarer Essence acquisition checks Plantera plus four Stars Above clears, a stricter condition than its book predicate. Tsukiyomi's predicate checks only `downedWarrior`. Its own `OnKill` also sets `downedStarfarers`, which limits what the Starfarer completion marker proves. The other seven entries supply no custom availability callback. The final Warrior phase's separate Boss Checklist lookup in `BossLoot` prints a message. No native miniboss or event registration was found.

**The omitted NPCs justify checking encounter tracking. They do not warrant three more entries.** `TwincruxPendant.UseItem` spawns Castor (1503) and Pollux together. Each twin checks that the other is gone before setting their shared completion flag. Nalhaun (1507) creates phase two in `NalhaunBoss.cs` line 650. The opening Warrior (1543) creates the final phase in `WarriorOfLightBoss.cs` line 720. Boss Checklist's `FindBossEntryByNPC` checks the entry's NPC list for record lookup. Native membership therefore matters for per-NPC tracking even when the shared completion callback works. Whether a player sees a tracking gap, whether external integration supplements membership, which keys finalize, and what the open book displays are all **UNVERIFIED**.

## Access routes, corrections and existing worlds

- **Everlasting Light — timing correction.** `EverlastingLightEvent.PostUpdateTime` advances a counter every 54,000 updates after Moon Lord while the Warrior is undefeated. The class initializes the preview and active thresholds to 2 and 7. Dialogue 304 can grant Progenitor Wish in either stage. The audit omits a shortcut in `ProgenitorWish.UseItem` lines 42–66. During preview, use sets `daysAfterMoonLord` to `daysUntilEverlastingLight`. The next eligible time update can activate the event, and a subsequent use can request the Warrior. The spawn check precedes the counter assignment. Seven increments describe the default passive route. The event's CSV wording should distinguish the preview's item unlock and acceleration from the active stage's first-summon gate. [Event and Warrior records](starsabove-1-1d.csv#L9)
- **Existing worlds.** `OnWorldLoad` resets active flags and elapsed counters. `LoadWorldData` reads the saved thresholds and counters, with no explicit 2/7 fallback for missing threshold tags. Warrior completion clears both event stages. Static code supports the timing rules but cannot settle a particular existing world's saved values, first activation, or behavior after a reload.
- **Arbitration.** `CelestialCompass.TeleportLyra` and `TeleportDreamingCity` gate voyages on Starfarer selection, cartography, portal or stellaglyph readiness, tier and cooldown. `SubworldPlayer` requests Katabasis after the anomaly counter exceeds 8,000 in Lyra or 22,000 in Dreaming City. The Katabasis grant checks a positive timer, no Arbitration boss and no Crux in the player's inventory. Ordinary Crux use outside enters the subworld, and use inside requests Arbitration. With the multiplayer fallback enabled, those destinations can award the Crux subject to a separate loot cooldown, and the item can send a direct spawn request. Successful transfers, timer survival, server handling and persistence of the clear remain **UNVERIFIED**. [Arbitration record](starsabove-1-1d.csv#L8)
- **Tsukiyomi — station-source clarification.** `MnemonicSigil.AddRecipes` registers four distinct traces at Celestriad Root. The clear dialogues for Warrior, Dioskouroi, Nalhaun and Penthesilea award them. The CSV cites a “CelestialCompass root gift.” In `TeleportObservatory` lines 434–458 that gift requires a multiplayer client, fallback enabled and the loot cooldown clear. Ordinary travel enters the Observatory, whose pinned English localization describes a Root on a plinth. Distinguish these routes when describing single-player acquisition. The sigil enters Eternal Confluence on ordinary single-player use outside, requests the boss inside, and sends a direct request from a multiplayer client. `EternalConfluence.CopySubworldData`, `ReadCopiedSubworldData` and `OnExit` reference the Tsukiyomi flag. Station access, crafting, actual spawns and return-trip persistence remain **UNVERIFIED**. [Tsukiyomi record](starsabove-1-1d.csv#L10)

The two clarifications above are sufficient for acceptance. No census or native registration correction is required. All gameplay and book observations remain reserved for a separately authorized runtime test.
