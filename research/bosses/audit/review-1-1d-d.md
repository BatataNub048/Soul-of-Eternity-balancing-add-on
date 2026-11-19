# Phase 1.1D-D independent review — Calamity Overhaul 0.9209.2

**PASS WITH CAVEATS. Accept Phase 1.1D-D as a static census.** The four additions and three native boss declarations are supported. Three distinct Dungeonworld fights remain pending ordinary entry. The pinned assemblies prove that Overhaul cannot perform its intended Checklist tracking clear. The effect on players’ records and progression remains unverified. The missing caveat register blocks final census closure.

I compared audit `140e12f5c94fd87b11838370adcae5aaf3b2eac4` with approved parent `338014797bb14f2c063ec2e65be479b6ca924ddb`. I used the retained `workbench/runtime/overhaul-1-1d-tools/entry.txt` and `references.txt`, then checked the named methods and fields directly in the retained Overhaul and Boss Checklist 2.2.4 DLLs. The checkout supplied readable context for the same paths. This review used static evidence throughout. [Audit](overhaul-1-1d-d.md) · [Disposition matrix](overhaul-1-1d-d.csv)

## Inventory and previous corrections

| Independently counted from the inventory at each commit | Parent | Audit |
|---|---:|---:|
| Confirmed encounter or event groups | 153 | 157 |
| Pending catalogue records | 16 | 13 |
| Other rows (4 candidates, 4 excluded helpers, 2 event tiers) | 10 | 10 |
| Total rows / distinct encounter IDs | 179 / 179 | 180 / 180 |

I matched each of the six Overhaul catalogue records to exactly one matrix row by owner, internal name and snapshot ID. The three confirmed heads or bosses replace three pending rows. OldNet Warden adds the one row outside the snapshot. The three other Overhaul records and ten other pending records retain their IDs. All 153 historical confirmed IDs survive. The only field edit to a previously confirmed group qualifies the additional Nihility Acteriophage. Only Overhaul’s coverage row changed. The checkpoint agrees with the inventory. The original catalogue has the same Git blob in both commits, `e1e2ff476f100be58ea2c8ef972990279fa895a7`. All seven audit changes are research files. [Inventory](encounters.csv) · [Coverage](mod-coverage.csv) · [Checkpoint](checkpoint.md) · [Catalogue](../encounter-catalogue.json)

All three D-C corrections are present. The D-C report, matrix and Nihility Twin inventory row restrict the extra linked Acteriophage to Zenith worlds. The pending Fountain’s `catalogue_records` lists `SpiritFountain; SpiritRing`. The Wraith’s ritual description identifies `VoidRitualCircle` as a projectile and its related-NPC field retains only `VoidCultistAssassin`. [D-C review](review-1-1d-c.md) · [Corrected matrix](entropy-inheritance-1-1d-c.csv)

## Three native bosses

| Snapshot and encounter | Exact native key | NPCs passed to LogBoss | Completion predicate | Source-defined summon |
|---|---|---|---|---|
| 1349 · Bloomsand Serpent | `CalamityOverhaul BssHead` | BssHead, BssBody, BssTail | `BssWorldFlag.DownedBloomSerpent` | Thorned Bloombud after Eye of Cthulhu, in surface Desert, with no active BssHead |
| 1352 · Festersand Serpent | `CalamityOverhaul FssHead` | FssHead, FssBody, FssTail | `FssWorldFlag.DownedFesterSerpent` | Festered Bloombud in surface Desert with no active FssHead. Its recipe consumes the first bud and Souls of Night. Its use check omits a Bloomsand kill condition. |
| 1354 · Abyssal Crystal Shrimp | `CalamityOverhaul SeaShrimpBoss` | SeaShrimpBoss | `SeaShrimpWorldFlag.DownedSeaShrimp` | Crystallized Shrimp Bait at the beach with no active SeaShrimpBoss |

Each ordinary item defines a recipe. Its `CanUseItem` checks the conditions above and `UseItem` targets its own Overhaul NPC through a spawn call or multiplayer request. The two serpent families have separate segments, summon targets and world flags. Neither item targets a Calamity or Fables Desert Scourge. Shrimp’s molt changes the state of the existing boss through `SeaShrimpMoltTransitionState`. Its test item supplied no accessibility evidence. Item acquisition, successful use and actual spawning in the maintained pack remain **UNVERIFIED**.

The three call sites are `BssChecklist.PostSetupContent`, `FssChecklist.PostSetupContent` and `SeaShrimpChecklist.PostSetupContent`. Their inherited loading gates return true in the pin. Each passes its owning mod, literal head or boss name, completion callback and NPC membership to `BossLogRegistry.Register`, which looks up Boss Checklist and calls `LogBoss`. Each boss’s `OnKill` addresses the flag read by its callback. The calls omit `availability`. Checklist’s `EntryInfo` constructor joins owner, space and internal name and supplies a true-returning default callback. Warden and the three room bosses have **scoped native absence**. External amendments, finalized dictionary membership and in-game visibility remain **UNVERIFIED**.

## OldNet and Dungeonworld access

**OldNet Warden ICE qualifies as one special encounter.** On world generation, `IndustrializationGen.ApplyPass` consults `SHPCCradleGen.Enabled`. Extinction density or a Remix world suppresses this Cradle. A successful sky placement can install the terminal. Failed siting invokes a chest-item fallback, which does not install a terminal. In single-player, a second interaction at the same armed terminal within 300 ticks invokes `OldNetWorld.EnterWorld`. This establishes a route for a suitably generated world. It does not establish a terminal in an existing save.

**Required route qualification.** The audit lists only the terminal. The retained `entry.txt` identifies a second caller, `OldNetPlayer.TickL3Dive`. Its pinned IL checks for the local single-player character, active layer-three Cyberspace, no active subworld, an unmounted player and Down held for 120 ticks before calling the same entry method. Cradle restrictions describe terminal generation. A world without that terminal still has this conditional entry path in code. Reaching layer three in a particular campaign remains **UNVERIFIED**.

Inside OldNet, `OldNetICEDirector.PostUpdateNPCs` starts cleanup on crossing noise tier four. It counts 2,700 ticks **with the cleanup wave active**. Noise can fall below the tier-four threshold while cleanup persists. Before dragnet lock, noise below 60 cancels the wave and resets the timer. `DispatchWarden` sets a once-per-dive guard and a spawn delay, then `SpawnWarden` creates `OldNetWardenICE`. On death, the Warden attempts a 16-shard ledger payout subject to capacity and `SilenceNoise(30)` caps current noise and grants temporary grace. This is a distinct combat outcome. Patrols and reinforcements belong to the dive’s escalation and contribute zero additional groups.

| Pending catalogue record | Watcher and in-room trigger | Boss created by precursor | Kill record ID |
|---|---|---|---:|
| 1357 · Deep Gaol Wraith | GaolBossRoomWatcher places GaolDormantSkull. A living player approaching the skull starts awakening. | `GaolDormantSkull.TransformToWraith` → DeepGaolWraith | 2 |
| 1363 · Foundry Overseer | ProofingHallWatcher places OverseerDormantRig. Standing on the dais triggers the rite. | `OverseerDormantRig.TransformToOverseer` → FoundryOverseer | 1 |
| 1366 · The Undrowned | FloodGalleryWatcher places UndrownedThrone. Standing in the valve zone triggers the rite. | `UndrownedThrone.TransformToUndrowned` → Undrowned | 0 |

All three loading gates return true. Each precursor creates the listed boss and each boss passes its own ID to `DungeonworldBossRecords.ServerSettleKill`. The no-room proximity fallbacks in rig and throne AI require an already present precursor. The transition callback inside `Dungeonworld.EnterWorld` calls `SubworldSystem.Enter<Dungeonworld>()`. The retained release references establish no ordinary caller into that wrapper. The checkout’s `RustedGaolIrons.CanUseItem/UseItem` are under `#if DEBUG` and absent from the pinned item. **Retain all three pending** until a supported player-facing entry can be identified. None of the precursors warrants an extra row.

**Other leads.** Scrap Commander is disabled in this release. `ScrapCommanderGate.Enabled` is false and the inherited NPC and beacon item loading methods both return false. The Kiyume director’s `PumpCortege` supports a procession with a leader and porters. The checkout’s Kiyume entry command is debug-only and absent from the pin. Ordinary scenario entry and an independent major encounter outcome remain **UNVERIFIED**. Keep the procession as an uncounted lead.

## Old Duke and Supreme Calamitas

**Proven static incompatibility, medium severity for tracking.** At IL_0026 in `BCKRef.TryGetActiveNPCEntryFlags`, Overhaul requests `BossChecklist.WorldAssist`. That type is absent from the pinned Checklist DLL. The namespaced `BossChecklist.Systems.WorldAssist` also lacks the field. The actual `int[] ActiveNPCEntryFlags` is declared on `BossChecklist.Systems.RecordSystem`. Lookup returns false and `SetActiveNPCEntryFlags` returns before its array write at IL_0020. Every inspected attempt to write −1 through this helper therefore misses the tracking array. This finding establishes neither a lost kill nor a permanent progression change.

| Path | NPC lifecycle and kill handling | Progression and synchronization evidence |
|---|---|---|
| Old Duke campsite redirect or departure | The override requires Calamity, single-player, inactive Boss Rush and its base gate. A generated campsite with the fight toggle off can redirect the existing NPC after earlier story branches. Redirect and final departure deactivate it and request a network update. Final departure also stops Acid Rain. | The tracking clear fails. Deactivation alone supplies no kill credit. The campsite message handler also attempts a clear and can relay the message. Its existence does not demonstrate an ordinary multiplayer redirect or synchronized records. |
| Old Duke combat defeat | `ModifyOldDuke.CheckDead` restores life, starts departure, handles the drop on the authoritative side and invokes `CWRRef.OldDukeOnKill` once through its counter. | The helper stops Acid Rain, attempts to mark `downedBoomerDuke` and Old Duke encountered, and calls `NPCLoader.OnKill`. The saved progression flag, Checklist completion and attempt record are separately observable outcomes. |
| Native Supreme Calamitas | Outside Boss Rush, `ModifySupCalNPC.AI` can teleport an active Eternal Blazing Now player to the boss, attempt the clear, deactivate the original NPC and set `netUpdate`. The despawn branch contains no kill call. | A separate non-Infernum branch can temporarily clear the Calamitas downed and Boss Rush flags during a Boss Rush scenario reaction. `PostAI` contains restoration. The despawn branch sits outside that Infernum guard. Persistence and client/server agreement remain untested. |

The native identities remain `CalamityMod OldDuke` and `CalamityMod Calamitas`. Hunt changes the Boss Rush roster. Inheritance registers its own `CalamityInheritance Scal` and legacy NPC. Overhaul’s Crabulon override targets Calamity’s existing Crabulon. These hooks add no boss identity and leave the previous duplicate-access findings supported. [Hunt review](review-1-1d-b.md) · [Inheritance review](review-1-1d-c.md) · [Crabulon runtime review](review-1-1c.md)

**Focused future test.** In disposable single-player copies, compare Old Duke’s campsite redirect, combat defeat and final departure with a normal kill control. For Supreme Calamitas compare an ordinary kill with the non-Boss-Rush scenario despawn. Record the NPC slot and active state, Checklist’s per-slot flag and attempt result, book completion, and the corresponding Calamity downed flag before the branch, immediately after and after save/reload. Observe restoration across AI/PostAI for the separate Boss Rush reaction. Where the scenario is supported in multiplayer, compare server and client observations. A requested network update alone cannot demonstrate agreement.

## Required corrections and closure

| Finding and severity | Required disposition | Effect on closure |
|---|---|---|
| Missing persistent caveat register · proven process defect, high for closure | The exact audit tree contains no `research/bosses/audit/caveats-register.md`. In the separately authorized closure stage, create the register and reconcile prior PASS WITH CAVEATS findings with their evidence, disposition and remaining work. | Blocks final encounter-census closure. D-D’s static counts can be accepted. |
| Incomplete OldNet route and imprecise escalation wording · documentation, low | At the next authorized research edit, add the layer-three route to the report, matrix and inventory. Describe the 45-second condition as active cleanup. Keep terminal presence and actual access in existing worlds open. | Carry into reconciliation. No count change. |
| Stale tracking clear · proven defect, medium. Visible effects · evidence gap | Record the precise type and field mismatch. Retain the scoped runtime comparison above for records, completion, progression and multiplayer behavior. | Accept the static finding now. Reconcile the outstanding runtime question before final closure. |
| Dungeonworld and Cortege access, world-specific OldNet access, item use and effective book coverage · evidence gaps | Preserve pending or unverified status. A supported entry path would justify revisiting the room fights. Successful normal use and observation of the finalized Checklist would settle the corresponding runtime fields. | No promotion or suppression is justified. Track disposition at closure. |

Phase 1.1D-D is accepted with these caveats. The three D-C documentation fixes are complete. Historical caveat reconciliation and Phase 1 remain open.
