# Phase 1.1D-D — Calamity Overhaul

Calamity Overhaul **0.9209.2** contributes three confirmed bosses and one confirmed scenario encounter. Bloomsand Serpent, Festersand Serpent and Abyssal Crystal Shrimp have native Boss Checklist declarations. The OldNet Warden ICE is the additional encounter outside the original boss-NPC snapshot. The three Dungeonworld parent records remain pending because access to their rooms in the pinned release is unverified. The census advances to **157 confirmed groups, 13 pending catalogue records and 180 inventory rows**. [Encounter and registration matrix](overhaul-1-1d-d.csv)

The starting revision was `338014797bb14f2c063ec2e65be479b6ca924ddb`. The three accepted D-C corrections are reflected in the maintained research. The retained Overhaul package matches the profile lock SHA-256 `0ca74f7935a8f6ec7572cdc4e43c9a1118e62b57139891ad894044e2b0bb830f`. Evidence comes from the existing Overhaul source checkout, Phase 1.1A's pinned DLL and metadata, and targeted pinned IL cross-references retained locally under `workbench/runtime/overhaul-1-1d-tools/`. The pinned assembly takes precedence over checkout debug paths. The target assembly contains 53 ModNPC types including inherited and abstract types. The original screen recorded 109 direct GlobalNPC types. The hook review follows the encounter and Checklist call sites. [Profile lock](../../../modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json) · [D-C review](review-1-1d-c.md)

## Original catalogue records

| Snapshot | Identity and disposition | Source route and relevant gates |
|---|---|---|
| 1349 `BssHead` | **Bloomsand Serpent**, confirmed boss. Body and tail are linked members. | `BssBloomBud` (Thorned Bloombud) summons the head after Eye of Cthulhu, on the surface in the Desert, with no active head. Its recipe uses cactus, sand and antlion mandibles. |
| 1352 `FssHead` | **Festersand Serpent**, confirmed boss. Body and tail are linked members. | `FssFesterBud` (Festered Bloombud) summons its own head on the surface in the Desert with no active head. The recipe uses Thorned Bloombud and Souls of Night. The use check has no Bloomsand defeat predicate. |
| 1354 `SeaShrimpBoss` | **Abyssal Crystal Shrimp**, confirmed boss. Its molt and other combat states use the same NPC. | Crystallized Shrimp Bait (`SeaShrimpSummonItem`) requires `ZoneBeach` and no active shrimp boss. The recipe uses Beetle Husk, Crystal Shard and Soul of Light. |
| 1357 `DeepGaolWraith` | Distinct Dungeonworld room boss with separate kill settlement. **Pending normal access.** | `GaolBossRoomWatcher` creates `GaolDormantSkull`. A nearby living player can trigger its transformation. The source checkout's debug-only `RustedGaolIrons` summon methods are absent from the pinned DLL. |
| 1363 `FoundryOverseer` | Distinct Dungeonworld room boss with separate kill settlement. **Pending normal access.** | `ProofingHallWatcher` creates `OverseerDormantRig`. Standing in the room's activation dais starts the rite that creates the boss. |
| 1366 `Undrowned` | **The Undrowned**, a distinct Dungeonworld room boss with separate kill settlement. **Pending normal access.** | `FloodGalleryWatcher` creates `UndrownedThrone`. Standing in the room's valve zone starts the rite that creates the boss. |

The first three rows resolve into distinct groups. The two serpents have separate summon items, heads, segment families and saved clear flags. Festersand's lore ties it to Bloomsand, while the item and world state support its own fight. The inspected paths target Overhaul types and leave Calamity and Fables Desert Scourge as separate encounter identities. The serpent storm effects follow their respective fights. The Shrimp test item is outside the ordinary route.

The pinned DLL enables the three Dungeonworld content gates. Their boss-room watcher and precursor calls are present, and the boss kill handlers call `DungeonworldBossRecords.ServerSettleKill` with separate IDs. The review of pinned references found the subworld entry wrapper but no ordinary caller of `Dungeonworld.EnterWorld`. The evidence qualifies the room triggers as conditional on access to Dungeonworld. An upstream route, existing-world access and runtime spawn remain **UNVERIFIED**. The dormant NPCs add no encounter rows.

## Additional encounters and leads

- **OldNet Warden ICE.** `IndustrializationGen` calls `SHPCCradleGen` when enabled, and the Cradle places the OldNet Access Terminal. The terminal's two-step interaction enters the subworld in single-player. `OldNetICEDirector` dispatches a Warden once per dive after 45 seconds of sustained high-noise cleanup and spawns the Warden NPC. `OldNetWardenICE.OnKill` pays out to the dive ledger and silences noise. This supports one special encounter. The patrols and cleanup waves are stages of the same scenario context for this audit. Cradle generation requires a non-Extinction density and a non-Remix world. Access in an existing world remains unverified.
- **Scrap Commander.** The pinned `ScrapCommanderGate.Enabled` is false. The inherited content-loading gates cover the Scrap Beacon and combat NPCs. The beacon code represents a disabled encounter route.
- **Kiyume and other actors.** `KiyumeHauntDirector` can spawn a Funeral Cortege with a leader and porters. Its ordinary scenario entry and qualification as an independent major encounter remain unverified. The retained table also includes hounds, dungeon elites, town NPCs Victor and TBUG, and a cyberware training dummy. The reviewed evidence supports population, service and training roles for those types. No separate event group is confirmed.

## Boss Checklist and existing encounters

| Canonical key | Category | NPC list | Completion predicate |
|---|---|---|---|
| `CalamityOverhaul BssHead` | LogBoss | BssHead, BssBody, BssTail | `BssWorldFlag.DownedBloomSerpent` |
| `CalamityOverhaul FssHead` | LogBoss | FssHead, FssBody, FssTail | `FssWorldFlag.DownedFesterSerpent` |
| `CalamityOverhaul SeaShrimpBoss` | LogBoss | SeaShrimpBoss | `SeaShrimpWorldFlag.DownedSeaShrimp` |

The pinned cross-reference identifies three callers of `BossLogRegistry.Register`: `BssChecklist.PostSetupContent`, `FssChecklist.PostSetupContent` and `SeaShrimpChecklist.PostSetupContent`. Each uses Overhaul as the owner and requires its enabled content and a loaded Boss Checklist. The calls omit `availability`, which defaults to true in Boss Checklist 2.2.4. The pinned keys are distinct. The Warden and Dungeonworld bosses have scoped native registration absence. Finalized registrations, external amendments and actual visibility for the new groups are **UNVERIFIED**.

`BCKRef.TryGetActiveNPCEntryFlags` looks up `BossChecklist.WorldAssist.ActiveNPCEntryFlags` by reflection. The pinned Checklist assembly has `BossChecklist.Systems.WorldAssist` and puts the array on `BossChecklist.Systems.RecordSystem`. Therefore the pinned lookup fails and the attempted per-NPC `-1` clears do not reach the array. The call sites provide no entry registration, NPC-list amendment or dictionary edit. The resulting record and completion behavior during scenario despawns needs runtime verification.

- **The Old Duke.** `ModifyOldDuke.CanOverride` gates the override on Calamity, single-player and Boss Rush being inactive, plus the base override check. With a generated campsite and the fight toggle off, the NPC can be deactivated and redirected into campsite dialogue. A departure path can also stop Acid Rain and deactivate the same NPC. The combat death override calls Calamity's Old Duke kill path once before the dive departure. The BCKRef calls appear on redirect and departure, including the scenario network handler. The existing `CalamityMod OldDuke` key and Hunt's separately documented Boss Rush roster change stay distinct.
- **Supreme Calamitas.** `ModifySupCalNPC.AI` can deactivate Calamity's existing NPC outside Boss Rush when a player is in the Eternal Blazing Now scenario, with an attempted BCKRef tracking clear. For its non-Infernum state-management branch, the override can temporarily clear the Calamity downed and Boss Rush flags for a scenario reaction and restore them in `PostAI`. The separate non-Boss-Rush despawn branch is outside that Infernum predicate. The native Calamity key and Inheritance's legacy fight retain their existing identities.
- **Crabulon.** `ModifyCrabulon.TargetID` targets the original Calamity Crabulon for the taming and mount behavior. The inspected path supplies no alternate boss ID, summon redirect or Checklist registration. Phase 1.1C's runtime findings for both owners remain the evidence for normal access.

## Reconciliation and runtime questions

The inventory started with **153 confirmed, 16 pending and 179 total**. Three pending rows become three confirmed bosses. The Warden adds one confirmed row outside the snapshot. The remaining three Overhaul pending IDs retain their original catalogue names, and ten other pending records carry forward. The original catalogue is preserved.

Runtime checks would establish ordinary item acquisition and successful summoning for the three bosses, Warden access in the maintained single-player world, and effective Checklist visibility and kill tracking. Dungeonworld needs evidence of a supported entry before the three room fights can be promoted. Existing-boss checks should distinguish scenario despawns, actual Calamity progression flags and Checklist tracking in the presence of the stale reflection lookup. [Maintained inventory](encounters.csv) · [Checkpoint](checkpoint.md)
