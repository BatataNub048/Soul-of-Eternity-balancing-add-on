# Phase 1.1D-C independent review

**PASS WITH CAVEATS. Accept Phase 1.1D-C as a static census.** The pinned implementations support nine distinct encounter groups and nine native Boss Checklist declarations. The three unresolved parent records belong in the pending inventory. One special-world condition and two inventory details need qualification.

Reviewed audit `f7179bb0f9b8671a409f857d4a0ffef2b472f53c` against approved parent `346f119e2165d63cd11ad00417c8fa0b1c6c3d5b`. Method and line references below refer to the retained pinned extracts in `workbench/runtime/entropy-inheritance-1-1d-tools/`. I also checked two specific methods directly in the pinned Inheritance assembly for the worm segments and the legacy crafting station. [Audit](entropy-inheritance-1-1d-c.md) · [Disposition matrix](entropy-inheritance-1-1d-c.csv)

## Census and historical evidence

| Measure independently counted | Parent | Audit |
|---|---:|---:|
| Confirmed groups | 144 | 153 |
| Pending catalogue records | 30 | 16 |
| Inventory rows, all with unique IDs | 184 | 179 |

I matched all 17 target records to exactly one matrix row by mod, internal name and snapshot NPC ID. Eight parent records account for five Entropy bosses and three Inheritance bosses. Six members resolve to parents: CruiserBody and CruiserTail to Cruiser, ChaoticCell to Nihility Twin, SpiritRing to Spirit Fountain, and both Supreme brothers to Supreme Calamitas Legacy. Acropolis Machine supplies the ninth encounter from outside the snapshot. AbyssalWraith, SpiritFountain and VoidPope remain pending alongside 13 records from other mods. Removing 14 pending rows and adding nine confirmed rows gives 179. All 144 previous confirmed rows match their parent revision field for field. The only edited surviving inventory rows are the three pending parents.

The two coverage rows agree with the pinned versions and findings. The checkpoint carries forward both accepted D-B qualifications. The original catalogue has the same blob in both revisions, `e1e2ff476f100be58ea2c8ef972990279fa895a7`. The five-file audit diff is confined to research. [Inventory](encounters.csv) · [Coverage](mod-coverage.csv) · [Checkpoint](checkpoint.md) · [Catalogue](../encounter-catalogue.json) · [D-B review](review-1-1d-b.md)

## Native registrations and source-defined routes

The table gives the full key as **owner + space + internal name**. Entropy denotes `CalamityEntropyLegacy` and Inheritance denotes `CalamityInheritance`. Completion flags belong to `EDownedBosses` for Entropy and `CIDownedBossSystem` for Inheritance.

| Owner and exact internal name | Call | Registered NPCs | Completion flag | Normal trigger in source |
|---|---|---|---|---|
| Entropy · `AcropolisMechine` | LogMiniBoss | AcropolisMachine | downedAcropolis | Natural Brimstone Crag spawn |
| Entropy · `Apsychos` | LogBoss | Apsychos | downedApsychos | Cursed Runestone in the Underworld |
| Entropy · `Luminaris` | LogBoss | Luminaris | downedLuminaris | Illusionary Dew in Astral Infection |
| Entropy · `TheProphet` | LogBoss | TheProphet | downedProphet | Prophecy Token in the Dungeon |
| Entropy · `NihilityTwin` | LogBoss | NihilityActeriophage, ChaoticCell | downedNihilityTwin | Nihility Horn targets the Acteriophage |
| Entropy · `Cruiser` | LogBoss | CruiserHead, CruiserBody, CruiserTail | downedCruiser | Void Bottle targets the head and emits a projectile |
| Inheritance · `CalCloneLegacy` | LogBoss | CalamitasCloneLegacy | DownedCalClone | Eye of Desolation Legacy at night |
| Inheritance · `PostEclipseYharon` | LogBoss | YharonLegacy | DownedLegacyYharonP1 | Yharon Egg Legacy in Jungle |
| Inheritance · `Scal` | LogBoss | SupremeCalamitasLegacy | DownedLegacyScal | Eye of Extinction targets legacy Supreme Calamitas |

`CalamityEntropyLegacy.cs` lines 1879–1890 and 2370–2550 and `CIWeakReferenceSupport.cs` lines 23–27 and 51–131 establish the calls, NPC arguments and predicates. Both integrations test for a loaded Boss Checklist. All nine omit the availability override. Boss Checklist 2.2.4 constructs the owner-qualified key and defaults availability to true (`BossChecklist.EntryInfo.cs`, lines 257 and 353). `CalamityEntropyLegacy AcropolisMechine` is the literal key. External amendments, final dictionary membership and in-game visibility for these nine are **UNVERIFIED**.

**Entropy grouping and gates.** Acropolis requires `ZoneCalamity`, no active machine and a nonpositive suppression timer. Its spawn weights are 0.18 before Hardmode, 0.07 in Hardmode before Moon Lord and 0.04 after Moon Lord. A favorited Signal Blocker refreshes the timer to five. The machine creates its harpoon and Apsychos creates its tail. Cruiser assigns its body and tail the head's `realLife` index. The Acteriophage links the cell to itself and can create small cells. The five Entropy items reject an active primary NPC of the corresponding type and active Boss Rush. The Horn and Bottle have no biome gate in their use checks. The item methods and recipes support the routes in the table. See `AcropolisMachine.cs` lines 561–575 and 677, `SignalBlocker.UpdateInventory`, `Apsychos.cs` line 381, `CruiserHead.cs` lines 1288–1297, and `NihilityActeriophage.cs` lines 940–965 and 1607.

**Legacy variants and cross-credit.** Each of the three items targets an Inheritance NPC and each encounter has a separate saved progression flag. Clone and Yharon also block Boss Rush and their own active legacy boss. The Eye of Extinction checks for an active legacy Supreme Calamitas. Its single-player path spawns above the player and its multiplayer client requests the same NPC type. The Supreme parent creates its brothers, seekers, worm hearts and worm head. `SCalWormHead.HandleWormBodySpawning` selects the body, weak body and tail. These components add zero independent fights.

Both `MarkSameBossDown` and `SolarEclipseChange` have a pinned default of false. The retained boss-access-1-1c-B configuration copy inspected for Inheritance contains the client config and supplies no server override for either setting. This supports a default-based reading. A live server's effective settings remain **UNVERIFIED**. With cross-credit enabled, the legacy Clone and full legacy Yharon kill handlers set their respective original Calamity flags. The inspected Supreme kill handler sets its legacy flag. With the eclipse option enabled, Yharon's second stage requires `DownedBuffedSolarEclipse`. The phase-one retreat can set P1 through `FirstDown`, satisfying the native Checklist predicate before a full kill. See `CIServerConfig.cs` lines 50–51 and 71–72, `CalamitasCloneLegacy.cs` lines 1296–1300, `YharonLegacy.cs` lines 375, 919–923, 1828, 2381 and 2470–2476, and `SupremeCalamitasLegacy.cs` lines 1401–1407, 1456–1457 and 2240.

**Crafting versus access.** I checked the eight items' `CanUseItem`, `UseItem` and `AddRecipes` paths. For the legacy Supreme summon, the Eye needs ten `AuricBarold` and 25 Ashes of Calamity at Inheritance's `DraedonsForgeold` tile. The legacy bar recipe uses Yharon Soul Fragments at the Cosmic Anvil. The legacy Forge item places the required tile and its own recipe includes 20 Darksun Fragments. If the eclipse option is enabled, `SolarEclipseChange.OnSpawn` and `OnPickup` suppress those fragments before legacy Yharon P1. This is a further dependency for crafting one's own station. Ingredient acquisition, station placement, crafting and successful summon use have no runtime verification here.

## Fallback and unresolved content

Entropy's `PostSetupContent` lines 2551–2588 guard the cross-owner `CalamityMod PrimordialWyrm` declaration on Infernum's absence. The fallback supplies the Calamity head, two body types and tail and reads `DownedBossSystem.downedPrimordialWyrm`. The 71-mod lock includes InfernumMode 2.0.1.35, so this call is inactive even when Infernum's custom AI setting is off. Phase 1.1B independently observed the finalized `InfernumMode PrimordialWyrm` entry and its conditional book visibility. Entropy's Wyrm town merchant adds no fight. [Package lock](../../../modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json) · [Retained runtime results](runtime-entries-1-1b.csv)

| Pending record or lead | Established behavior | Missing evidence |
|---|---|---|
| Abyssal Wraith | Four active cultists can initiate the ritual. Summoning cultists advance the projectile countdown. Losing all participants cancels the spawn. Successful completion creates the Wraith on authoritative execution. The boss has its own downed flag. | An ordinary route to the eligible cultist population. |
| Spirit Fountain | The parent creates rings. Each ring checks its parent and links its life by NPC index. | A normal trigger for the parent in the pinned pack. |
| Void Pope | Its AI creates two hands with the Pope's index. | A normal parent spawn or evidence connecting it to an activated event. |
| Delirium | Its AI and the tagged-NPC detour create alternative forms. | A normal initial Delirium spawn. |
| Void Invasion | The system drives a sky effect when active and resets progress when inactive. | An initiation path, encounter roster and completion condition. |

The five have scoped native Checklist absence. Their pack-wide registration and access remain **UNVERIFIED**. Sources include `VoidCultist.SummoningAI` and `AI`, `VoidRitualCircle.cs` lines 39–99, `SpiritFountain.cs` lines 581 and 608, `SpiritRing.cs` lines 235–245, `VoidPope.cs` lines 146–147, `Delirium.cs` line 95 and `VoidInvasion.PostUpdateEverything`. Experimental checkout references provide insufficient evidence of a subworld route in the pinned assembly.

## Required qualifications

1. Qualify the extra linked Acteriophage in the report and inventory. The normal pair is Acteriophage and Chaotic Cell. The additional Acteriophage spawn at `NihilityActeriophage.cs` lines 952–965 requires `Main.zenithWorld`. All three NPC instances still belong to one encounter.
2. Preserve `SpiritRing` in the pending Fountain parent's `catalogue_records` field on the next inventory edit. The matrix accounts for snapshot record 1412 and the inventory lists it under related NPCs, but the parent row's catalogue field lists only `SpiritFountain`. The ring's membership is resolved.
3. Classify `VoidRitualCircle` as a projectile in the Wraith's trigger description. The inventory currently includes it under `related_npc_ids`. The cultist is an NPC participant.

These are documentation corrections. The nine native declarations, the disposition of all 17 records and the 153-group census stand.
