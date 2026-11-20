# Boss Checklist encounter census completion plan

Phase 1.1E-0 starts from `c9a98ece4e5dc53fb23691e49cdceb64e7bf8ebf`. The inventory has **157 confirmed groups, 13 pending catalogue records and 180 rows**. The other ten rows are four candidates, four excluded helpers and two Acid Rain tier registrations. The first static census comprised 131 confirmed groups. The original snapshot contains 135 NPC records. The 71 pinned mods have 13 targeted and 58 preliminary coverage rows. The priority and pending tables below preserve the E-0 planning baseline. E1 and E2 resolve three pending records each and move four mods to targeted static scope in total. E2 also records a special encounter outside the snapshot. E3 resolves Sir Nautilus, confirms both tested Fables counterpart IDs and assigns Permafrost to Cryogen. Current totals are in the checkpoint. [Checkpoint](checkpoint.md) · [Inventory](encounters.csv) · [Coverage matrix](mod-coverage.csv) · [Original catalogue](../encounter-catalogue.json) · [Caveat register](caveats-register.md)

## Static census

Start with positive leads, then close bounded context checks. Use published evidence and retained type/call tables first. Follow only the caller, NPC parent or completion path needed to settle a disposition. Stop tracing a route when the evidence cannot establish a player-facing trigger and document the boundary. Each batch should report owner, parent or standalone grouping, trigger and gates, the registration scope, evidence confidence and any remaining runtime question. A named NPC, boss flag, literal, or empty call column by itself is insufficient.

| Priority among the 58 preliminary mods | Mod IDs | Evidence and next action |
|---|---|---|
| HIGH (10) | `InfernumMode`, `WoTM`, `CalValEX`, `UnofficialCalamityWhips`, `FargowiltasSoulsDLC`, `RagnarokMod`, `ThoriamityConvergenceREDUX`, `CalamityBardHealer`, `calamityzeith`, `TerrariaPackCompat` | Pending catalogue or explicit integration leads. Trace encounter, summon or roster hooks in the bounded batches below. For integrations with no named target in the retained table, check the known registration and spawn entry points before widening scope. |
| MEDIUM (12) | `Fargowiltas`, `TerrariaPackGuard`, `FargoSeeds`, `TitanWorlds`, `UnCalamityModMusic`, `FaeFargoShopCompat`, `CalamityAmmo`, `PetsOverhaul`, `PetsOverhaulCalamityAddon`, `CalamityRarities`, `LAP`, `MagicStorage` | Check candidate NPC roles, world generation and seed gates, or the concrete hook called out by the retained screen. Start with Fargo town NPCs and shop triggers, the MagicStorage Golem identity, TitanWorlds’ world effects, FargoSeeds, and the `UnCalamityModMusic.BossChecklistCompatibility.BossChecklistSetup` and `LAP.Load` literals. Trace output only far enough to classify the effect. |
| LOW (36) | `CalamityModMusic`, `SubworldLibrary`, `FargowiltasMusic`, `Luminance`, `AlchemistNPCLite`, `NoFishingQuests`, `ShopExpander`, `SerousCommonLib`, `AutoTrash`, `BAM`, `BetterZoom`, `RecipeBrowser`, `WingSlotExtra`, `WMITF`, `SharedMap`, `BossCursor`, `miningcracks_take_on_luiafk`, `ClamExtraMusic`, `CraftableCalamityItems`, `StartingBags`, `BetterBossBarPlus`, `MSStarterBag`, `Munchies`, `Munchies_CalamityAddon`, `AbilityToRead`, `InfernumModeMusic`, `OreExcavator`, `AmuletOfManyMinions`, `TooManySlots`, `ImproveGame`, `MoreAccessories`, `ColoredCalRelics`, `InnoVault`, `SilkyUIFramework`, `Census`, `CalamityMagicStorage` | Reuse the screen and known mod role for a scoped disposition. Check the retained Checklist or integration leads named in E7 and reopen a specific mod if a caller, NPC, event or preset dependency points to it. |

| Batch | Scope and exit evidence |
|---|---|
| E1 · Infernum and WoTM | Resolve both Ares-family leads and Vassal's trigger and shark grouping. Verify WoTM's Checklist detour and Boss Rush cleanup effect. Track access separately for Dreadnautilus (fishing or Red Bait), Primordial Wyrm (first Chaos State spawn), and Bereft Vassal (core and arena portal). Reuse 1.1B for book visibility. E1 static evidence is published and awaits independent review. [Audit](infernum-wotm-1-1e-1.md) |
| E2 · CalValEX and Unofficial Calamity Whips | Decide Fogbound, Meldosaurus and Scraper of Stars family. Follow trigger, body/head ownership and completion. Check CalValEX’s Astral Blight dependency only where it changes Catalyst access. Accepted with caveats. E3 applies the loot and multiplayer documentation corrections. [E2 review](review-1-1e-2.md) |
| E3 · Fargo and Fables | Resolve Permafrost, Echdeath route evidence, and Sir Nautilus. Inspect the pinned Souls DLC and involved Crossmod dependencies. Confirm any separate entry applies to the intended encounter. Map each of the four verified Calamity/Fables boss identities in 1.1C to its maintained encounter ID. The published mapping and static dispositions await independent review. [E3 audit](fargo-fables-1-1e-3.md) |
| E4 · Entropy and Overhaul | Trace upstream triggers for the three Entropy parents plus Delirium and Void Invasion. Look for a supported Dungeonworld caller and a normal Kiyume trigger. Use the proven disabled status for Scrap Commander. |
| E5 · Thorium-facing integrations | Bound `RagnarokMod`, `ThoriamityConvergenceREDUX` and `CalamityBardHealer` to encounter identity, eligibility and Checklist effects. Reuse the Thorium scope and check Patch Werk’s event-pool relationship with the finalized pool evidence. |
| E6 · Calamity and pack hooks | Inspect relevant `calamityzeith` and `TerrariaPackCompat` changes. Use the evidence from E1–E5 to scope the remaining Medium checks. Include THE LORDE’s acquisition gate and any concrete encounter changes from `TerrariaPackGuard`, `TitanWorlds` and seed modifiers. |
| E7 · Remaining content coverage | Bound native vanilla, Calamity, Thorium, and Fargo coverage to named rare-enemy, miniboss and event leads outside the original registration methods. Dispose of the Stars Above ambient and Spectre leads using their spawn and outcome evidence. For CalamityModMusic, inspect the retained Checklist literal in `Load` only far enough to distinguish metadata or a lookup from an entry or membership change. For ClamExtraMusic, Munchies_CalamityAddon and CalamityMagicStorage, use existing integration leads to check for encounter or Checklist effects. Close each LOW scope with a stated evidence boundary. |

### Pending catalogue records

Internal names below correspond to the exact pending inventory IDs of the form `owner/catalogue-name`. Evidence from a normal trigger can supplement static identity. A repeat registration observation is unnecessary for keys already verified in 1.1B. [Pending inventory](encounters.csv)

| Owner | Pending record | Smallest next evidence |
|---|---|---|
| InfernumMode (2) | `AresEnergyKatana` | Read creator and parent attachment to see whether it is part of Ares and shares the Exo Mech outcome. |
| InfernumMode | `BereftVassal` | Follow the normal arena/challenge trigger and Great Sand Shark linkage to decide encounter boundaries. |
| CalamityOverhaul (3) | `DeepGaolWraith` | Check the shared Dungeonworld entry first. If established, use the already pinned skull-to-Wraith and record ID 2 evidence. |
| CalamityOverhaul | `FoundryOverseer` | Use the same entry check and the already pinned dais-to-Overseer and record ID 1 evidence. |
| CalamityOverhaul | `Undrowned` | Use the same entry check and the already pinned valve-to-Undrowned and record ID 0 evidence. |
| CalamityEntropyLegacy (3) | `AbyssalWraith` | Trace creation of enough eligible Void Cultists under ordinary conditions. The ritual projectile already establishes downstream spawning. |
| CalamityEntropyLegacy | `SpiritFountain` | Find the initial parent spawn or event activation. Reuse confirmed SpiritRing membership. |
| CalamityEntropyLegacy | `VoidPope` | Find the initial spawn and whether Void Invasion actually creates or unlocks it. The hand relationship is established. |
| CalamityFables (1) | `SirNautilus` | Confirm first eligible dialogue and duel start, followed by one trigger observation if needed. Reuse the finalized-key and book result. |
| CalValEX (2) | `Fogbound` | Inspect its own spawn or summon caller and defeat outcome to distinguish an independent encounter from a helper or gated actor. |
| CalValEX | `Meldosaurus` | Locate its first normal spawn and completion or parent link. Check pinned content gates. |
| UnofficialCalamityWhips (1) | `ScraperOfStarsHead` | Trace head creation and segment linkage, then check whether the player trigger and outcome support a distinct encounter. |
| WoTM (1) | `AresHand` | Compare creator, parent link, completion and Checklist arguments with existing Exo Mechs and the already-grouped Crossmod hand. |

### Outside the snapshot and candidate dispositions

Review event activation and outcome for Void Invasion, and entry and independent completion for Funeral Cortege. Resolve Delirium’s initial spawn, the Stars Above Paracausal Enigma, Asteroid Worm and Spectre of Light leads, and ordinary encounter significance for any new event or rare NPC found in the bounded follow-ups. Everlasting Light and OldNet Warden are already counted. Preserve their IDs while checking access and intended Checklist role. The four inventory candidates need explicit dispositions: THE LORDE, Permafrost and the two Fables overlap bookkeeping rows. For the overlap rows, reconcile existing identities and keys without counting the same encounter again. [Stars review](review-1-1d-a.md) · [Entropy review](review-1-1d-c.md) · [Overhaul review](review-1-1d-d.md)

## Checklist pass

After the relevant static batches, use one authorized runtime capture against the pinned pack where shared save states permit it. Record package versions, effective configuration, world flags, owner-qualified key, final NPC IDs, category, event membership, evaluated availability and rendered visibility. A call, a finalized key, an unavailable row, a masked row and a rendered name are distinct observations. Use settled UI states and retain private evidence locally.

- Capture the D-series keys and scoped absences in the same pass. Prioritize Starfarers and Tsukiyomi predicates, external or event membership for Everlasting Light, Ascended Astral Slime and Warden, and any newly relevant pending leads. Record expected role before treating an absence as actionable.
- Compare final NPC lists against the three omitted Stars Above actors and Fargo Timber head. Observe tracking at phase transition and a normal completion control where needed. Check Patch Werk’s event-pool membership separately from its standalone registration.
- Capture the effective Boss Rush roster and spawn mapping after Hunt and Infernum's roster changes. Check whether WoTM's Ares Hand cleanup exemption remains on the effective Draedon entry. Reuse 1.1B for confirmed Infernum and Fables visibility. Rerun only evidence affected by a changed pin or integration.

## Access tests

Use separately authorized disposable save copies and group cases by progression and configuration. A recipe, collection of ingredients, crafting, accepted use, spawned NPC, kill credit and persisted flags each establish a distinct claim. Prioritize first access, existing-save issues and cross-credit over optional alternate acquisition.

| Shared test scope | Narrow observation |
|---|---|
| Pre-Hardmode and gated starts | If end-to-end proof is needed, gather legitimate inputs and make the two Fables-to-Crossmod conversions, using 1.1C for demonstrated spawn outcomes. Verify the eligible Sir Nautilus trigger only where E3 leaves a material ambiguity. |
| Infernum ordinary access | Use one legitimate trigger per material unresolved claim. In Hardmode test Dreadnautilus fishing or Red Bait. Test the first Wyrm spawn from Chaos State. For Vassal, verify the core, portal, first arena spawn, shark phase, retreat and persistence on exit/reload. Reuse 1.1B book evidence. |
| Catalyst and Hunt | Acquire the Communicator before the first-clear lock and observe the first eligible Slime Rain Goozma route. Compare concurrent absorption with a normal Astrageldon defeat and record separate phase/full, loot, book and persistence outcomes. |
| Stars Above and OldNet | Use eligible copied existing saves to observe Everlasting Light preview/Wish/activation, the Arbitration and Tsukiyomi transfers and persistent clears, and a reachable Warden dive. Inspect actual Cradle and layer-three availability before attempting the dive. Test multiplayer fallback only in supported routes where it matters. |
| Inheritance | Read effective server settings. Check legacy versus original flags with cross-credit on and off, Yharon P1 and full clear, and the eclipse gate. Verify Forge-to-Eye acquisition if it determines ordinary access. |
| Overhaul and native Calamity | Compare Old Duke and Supreme scenario branches with ordinary kill controls. Capture NPC slot, tracking, attempts, downed flags and save/reload. Compare client and server only where the route supports multiplayer. Confirm one ordinary summon per new Overhaul boss when runtime proof is necessary. |
| Special and pending routes | Attempt Echdeath using one applicable disposable world if needed. Test Dungeonworld only after a supported entry is established. Use the same rule for other pending parents. |

## Compatibility decisions and documentation

The two proven compatibility defects in the register are Overhaul’s stale tracking-field reflection and Fables’ obsolete suppression signatures. Give Overhaul a separately authorized repair or a reviewed disposition backed by scenario-impact evidence. For Fables, retain all four accepted entries and settle whether to retire the failed suppression hook. Owner labels and configuration-aware hints are optional. A missing native registration or an omitted NPC argument warrants an intended-role and runtime-effect check before any change. Keep Hunt’s Boss Rush change separate from Overhaul’s Old Duke story hooks.

The OldNet corrections and D-D acceptance are recorded in this batch. Remaining documentation includes the Stars Above focused summon/timing qualifications, the Phase C forward-conversion wording, the Catalyst/Hunt focused summon wording and any evidence-backed candidate or coverage updates. Keep original audit evidence and catalogue intact. Link each correction to its register ID and keep historical counts explicit.

## Review and milestones

Each scoped audit batch needs independent verification of the exact commit, pin evidence, encounter grouping, inventory and catalogue reconciliation, registration scope and caveats. Have an independent reviewer assess the runtime evidence for closure blockers and regression evidence for authorized fixes. Use targeted review of subsequent documentation corrections. Put the closure decision in a final independent review that names the remaining accepted limitations and the approving decision.

| Milestone | Criteria |
|---|---|
| `AUDIT BATCH ACCEPTED` | Scoped findings are reviewed and accepted, with outstanding items registered. Earlier D-D acceptance is at this level. |
| `CENSUS COVERAGE COMPLETE` | Every scoped coverage question has an evidence-backed disposition. The 13 pending records, four candidates, outside-snapshot leads, preliminary rows and residual targeted-mod scope are explicitly reconciled. Unresolved access can remain if the search boundary, missing evidence and reason for deferral are recorded. Validate unique encounter IDs, original catalogue accounting, family relationships, totals and native/external/finalized scope. |
| `CAVEAT RESOLUTION IN PROGRESS` | Use the register for separately authorized fixes, tests and decisions. A coverage disposition can precede a runtime answer. Mark blocked prerequisites and link revised evidence to the exact claims. |
| `PHASE 1 CLOSED` | Census coverage is complete. Every caveat has a recorded disposition, every closure blocker is resolved or has a reviewed evidence-backed outcome that clears the blocker, and residual limitations are explicitly accepted. Major or critical risks require independent review and a documented decision. Required reviews, final evidence and closure approval are linked from the checkpoint. |

This planning batch prepares the register and work packages. Phase 1 remains open.
