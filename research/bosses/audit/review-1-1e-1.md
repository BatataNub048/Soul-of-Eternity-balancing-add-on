# Phase 1.1E-1 independent review — Infernum and WoTM

**PASS WITH CAVEATS. Accept Phase 1.1E-1 as a static census batch.** Bereft Vassal adds one encounter. Both Ares actors belong to the existing Exo Mechs fight. Two wording corrections are due at the next documentation update. Ordinary gameplay access, saved defeat credit and the effective combined Boss Rush roster remain open.

Reviewed `cc121630e560e6fa2c7faee26700844ce96e885c` against approved parent `b03de556e48376c6c1b98e28ce380c87b6089a9b`. I compared the committed files and checked the retained InfernumMode 2.0.1.35, WoTM 1.0.5, CalamityMod 2.2.4 and Boss Checklist 2.2.4 evidence. For fishing and kill dispatch I also inspected the installed tModLoader 2026.9.3.1 assembly, whose SHA-256 matches the approved pin. Runtime observations below come from 1.1B. [E1 report](infernum-wotm-1-1e-1.md) · [E1 matrix](infernum-wotm-1-1e-1.csv) · [Assembly digest](coverage.md) · [1.1B review](review-1-1b.md)

## Census and catalogue identities

| Existing inventory ID | Snapshot NPC ID | Verified disposition |
|---|---:|---|
| `InfernumMode/catalogue-AresEnergyKatana` | 1325 | Excluded helper. Infernum's Ares body creates two attack arms with side values −1 and +1. Both branches assign the body's index to the spawned NPC's `realLife`. |
| `WoTM/catalogue-AresHand` | 1550 | Excluded helper. WoTM's Ares body creates four hands. Each requires an active Ares body with WoTM behavior, follows its instructions and sets `realLife` to the tracked body during AI. |
| `InfernumMode/catalogue-BereftVassal` | 1333 | Confirmed boss. The Lost Colosseum encounter has its own opening, shark phase, retreat and registered completion predicate. |

I parsed both revisions of the inventory. The 180 unique IDs match exactly. Only the three rows above changed. Confirmed groups went from **157 to 158**, pending records from **13 to 10** and excluded helpers from **4 to 6**. Four candidates and two Acid Rain tiers complete the 180 rows. All 157 previously confirmed rows compare equal. The original catalogue has the same Git blob at both revisions, and expanding each inventory's catalogue fields reproduces all 135 original owner/NPC pairs with matching multiplicity. Only Infernum and WoTM changed coverage, bringing the 71 mods to **15 targeted static and 56 preliminary**. The checkpoint agrees. [Inventory](encounters.csv) · [Catalogue](../encounter-catalogue.json) · [Coverage](mod-coverage.csv) · [Checkpoint](checkpoint.md)

## Ares parentage and competing overrides

Infernum's `AresBodyBehaviorOverride.PreAI` creates the katanas off-client at IL_03FD–0482. `AresEnergyKatana.AI` deactivates the arm when the tracked Ares body is missing. Its in-use state controls vulnerability. WoTM's `AresBodyBehavior.CreateArms` uses the body as the spawn start and initially links successive hands to their predecessor. `AresHand.AI` then assigns the tracked body's index. `CheckDead` holds the hand at one life and returns false. The already-grouped `FargowiltasCrossmod/AresHand` is a third, separately owned NPC type. Neither E1 component has evidence of an independent trigger, clear or key.

Calamity's `LogBoss` for `CalamityMod ExoMechs` declares Apollo, AresBody, Artemis and ThanatosHead and reads `Downed.DownedExoMechs`. The key shown for the helpers in the E1 matrix identifies their parent. Finalized helper membership is **UNVERIFIED**. WoTM's `NPCOverrideGlobalManager.OverridesPermitted` disables its overrides when Eternity is active and Crossmod is loaded. Its separate `InfernumOverridingSystem` temporarily clears the Infernum flag during detected Draedon/mech updates and drawing, with restoration paths. That system's update checks do not consult the Fargo override gate. Which arms actually appear in a supported configuration requires an observation of that fight. [E1 Ares evidence](infernum-wotm-1-1e-1.md#ares-family-components)

## Infernum access and Checklist evidence

| Finalized key | Source-defined route | Checklist availability |
|---|---|---|
| `InfernumMode Dreadnautilus` | `Projectile.FishingCheck_RollEnemySpawns` can roll NPC 618 at night during a Hardmode Blood Moon in water. Infernum's craftable Red Bait checks night and absence of 618, then requests 618 off-client. Its use check requires neither a Blood Moon nor Hardmode. | Custom AI and Hardmode. Completion reads Calamity's `downedDreadnautilus`. |
| `InfernumMode PrimordialWyrm` | Calamity's `WorldMiscUpdateSystem.TrySpawnAEoW` requests the head for a living player with Chaos State in the Abyss or a Zenith world, off-client, outside Boss Rush and without an active tracked head. Infernum's conditional Wyrm loot supplies the Evoking Searune. Rune use requires Abyss layer four and no active head. This supports a repeat route. | Custom AI and Hardmode. Completion reads Calamity's `downedPrimordialWyrm`. |
| `InfernumMode BereftVassal` | Possess Sandstorms Core, open the portal, enter the Lost Colosseum and approach the idle Vassal. The Waterglass Token provides repeat entry through the traced Vassal/bag loot. | Custom AI and Cultist defeated. Completion reads Infernum's `WorldSaveSystem.DownedBereftVassal`. |

Infernum declares all three keys when Checklist is loaded. The predicates govern availability. The 1.1B matrix contains finalized identities and named book observations for all three under the recorded filters and progression settings. **Ordinary initial access in the pinned pack remains UNVERIFIED for each.** BC-002 correctly preserves the three separate questions. [Runtime matrix](runtime-entries-1-1b.csv) · [Access evidence](infernum-wotm-1-1e-1.csv) · [Caveat register](caveats-register.md)

### Vassal, shark and saved credit

`WorldgenSystem.ModifyWorldGenTasks` schedules entrance generation. The Cultist kill handler retries generation for NPC 439 when the entrance flag is clear and the player is outside subworlds. `ColosseumPortal.RightClick` checks core possession without consuming it. Proximity to the open portal advances the transition, and entry checks custom AI. Infernum blocks direct core use while custom AI is active. The base recipe and Infernum ingredient adjustment establish a crafting route. Placement, crafting and entry in an eligible existing save remain unobserved.

**Required wording correction.** “Once per visit” is too strong. `WorldUpdatingSystem.PostUpdateEverything` (IL_0115–0183) requests the Vassal off-client while the subworld is active, the local player is alive and the appearance flag is clear. During combat, an inactive, dead or out-of-arena target can cause `BereftVassal.AI` to deactivate the NPC and clear that flag (IL_022F), permitting another spawn in the same visit. Initial spawn and combat start also differ. `DoBehavior_IdleState` starts the introduction when a valid living target comes within 700 pixels.

Below 60% health the Vassal initiates the summon of Calamity's actual `GreatSandShark`. Its override inherits the leader's combat state and deactivates without a Vassal. Infernum's native boss entry includes both types, as 1.1B confirmed. Calamity's distinct `CalamityMod GreatSandShark` miniboss entry reads `downedGSS`, which the shark's own `OnKill` sets. Keep both encounter identities. Independent shark access with Infernum active and the arena shark's effect on its standalone record remain **UNVERIFIED**. [Registration evidence](runtime-entries-1-1b.csv)

`BereftVassal.CheckDead` enters retreat and returns false. During retreat the NPC clears its boss flag and calls `NPCLoot` (IL_0317). The pinned engine can reach the Vassal flag from that call. On the authoritative side, if `NPCLoader.PreKill` permits loot, `NPC.NPCLoot` calls `NPCLoader.OnKill` (IL_0148), which dispatches to `ModNPC.OnKill`. The Vassal handler sets its flag and requests synchronization. The later fade records the arena defeat, Bestiary kill and player achievement update before deactivation.

On return, `WorldUpdatingSystem.PostUpdateEverything` can register Bestiary kills for **both** NPCs from the arena defeat marker. `LostColosseum.OnExit` also carries a player achievement marker. Neither operation measures the two Checklist completion predicates. The subworld has world-data copy/read methods, and Infernum's save/load methods serialize the Vassal flag. A future authorized check should compare both downed flags and Checklist entries before the encounter, after the shark and retreat, after portal exit and after reloading the main world. Successful exit, preserved progress and multiplayer synchronization remain **UNVERIFIED**.

## WoTM, Boss Rush and BC-015

WoTM resolves the pinned instance method `BossChecklist.EntryInfo.GetDespawnMessage(Terraria.NPC)`, returning `LocalizedText`. Its detour returns null for AresBody, ThanatosHead, Artemis and Apollo, and calls the original otherwise. The inspected integration declares no standalone key and makes no membership edit. Successful installation and actual message behavior remain **UNVERIFIED**.

`WoTM.PostSetupContent` iterates the existing roster. Its callback (IL_0001–0018) appends `WoTM/AresHand` to the Draedon entry's `HostileNPCsToNotDelete` list. The inspected references show no WoTM boss insertion, removal, reorder or spawn-callback replacement. Infernum writes `BossRushEvent.Bosses` in `OnModLoad` (IL_0DA0) and assigns either list in `SwapToOrder` (IL_0008, IL_0027). Hunt independently removes Old Duke and inserts Goozma after Supreme Calamitas. **BC-015 correctly remains OPEN.** A later capture must identify the active roster, spawn delegates and Draedon hand exemption after applicable swaps. [E1 integration](infernum-wotm-1-1e-1.md#wotm-checklist-and-boss-rush) · [Hunt review](review-1-1d-b.md#compatibility-and-limits-of-acceptance)

## Planning corrections and register

All five E-0 corrections are in place. **BC-002** names all three initial-access questions. **BC-009** marks Sir Nautilus dialogue, shared hit pool and duel start unverified. **E7** scopes the `CalamityModMusic.Load` Checklist literal and the retained ClamExtraMusic, Munchies_CalamityAddon and CalamityMagicStorage leads. **E3** requires a four-fight Calamity/Fables ID mapping and an explained count delta. **BC-010** now resolves to the Stars review's singular registration heading. [E-0 requirements](review-1-1e-0.md#required-planning-corrections) · [Completion plan](census-completion-plan.md) · [Corrected Stars section](review-1-1d-a.md#native-registration-and-npc-membership)

All 32 caveat IDs retain their status, classification and severity. **25 OPEN + 1 BLOCKED (BC-020) = 26 outstanding**. BC-026, 027, 028, 030, 031 and 032 are the six resolved. Outstanding rows comprise ten high and ten medium unverified behaviors, two medium proven defects, three low documentation corrections and one low optional improvement. BC-005 still tracks the obsolete Fables suppression signatures. BC-022 still tracks Overhaul's unreachable Checklist tracking-array write. Both proven defects require a disposition. [Register](caveats-register.md)

**Required register clarification.** Label BC-001's “58 preliminary mods” as the E-0 baseline or refer readers to the checkpoint for the current 56. The published counts and the three E1 dispositions stand. The remaining access, credit and compatibility questions require their own evidence or an explicitly reviewed limitation before Phase 1 closure.

**E1 INDEPENDENT REVIEW COMPLETE — PHASE 1 REMAINS OPEN.**
