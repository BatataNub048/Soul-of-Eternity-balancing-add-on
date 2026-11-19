# Phase 1.1D-C — Calamity Entropy Legacy and Calamity Inheritance

Calamity Entropy Legacy **3.39.1** adds five bosses and one miniboss with source-defined normal routes. Calamity Inheritance **2.0.4.19** adds three independently summoned legacy boss variants. Each of these nine groups has a native Boss Checklist declaration. No additional event group reached the confirmation threshold. The inventory advances from **144 to 153 confirmed groups**, with **16 pending catalogue records** and **179 total rows**. [Encounter and disposition matrix](entropy-inheritance-1-1d-c.csv) · [Inventory](encounters.csv)

The audit starts from accepted commit `346f119e2165d63cd11ad00417c8fa0b1c6c3d5b`. It uses the two pinned DLLs and retained Phase 1.1A type and call tables. The two retained package hashes match the lock. It also uses the existing Entropy source checkout as a cross-reference, and targeted reads of pinned types under `workbench/runtime/entropy-inheritance-1-1d-tools/`. The original catalogue supplies numeric snapshot IDs. A confirmed group here means a distinct fight with a supported source route. Item acquisition, summon success and Checklist visibility remain separate runtime questions. [Package lock](../../../modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json) · [Original catalogue](../encounter-catalogue.json)

## Entropy Legacy

| Group | NPC grouping | Normal route and gates |
|---|---|---|
| Acropolis Machine | `AcropolisMachine` and spawned `Harpoon` | Natural spawn in the Brimstone Crag zone. The spawn check requires no active machine and an inactive `AcropolisDontSpawn` timer. A favorited Signal Blocker refreshes the timer. The pool weights are 0.18 before Hardmode, 0.07 in Hardmode before Moon Lord and 0.04 after Moon Lord. |
| Apsychos | `Apsychos` creates `ApsychosTail` | Cursed Runestone in the Underworld. Its recipe uses Hellstone, an evil bar, Fallen Star and Ancient Bone Dust. |
| Luminaris | `Luminaris` | Illusionary Dew in Astral Infection. The recipe uses Starblight Soot and Fallen Stars. |
| The Prophet | `TheProphet` | Prophecy Token in the Dungeon. The recipe uses Books and Souls of Light. |
| Nihility Twin | `NihilityActeriophage` creates and links `ChaoticCell` and additional copies of its own type. It can also create `ChaoticCellSmall` from the cell position. | Nihility Horn targets the Acteriophage. Its recipe uses Exodium Cluster and Voidstone. The item checks for an existing Acteriophage and Boss Rush, with no biome check. |
| Cruiser | `CruiserHead` creates its body and tail, linking them to the head via `realLife` | Void Bottle requests the head and emits a thrown bottle projectile. Its recipe uses Dark Plasma and a Bottle. The item checks for an existing Cruiser head and Boss Rush, with no biome check. |

The three biome-specific summon items also reject Boss Rush and an existing boss of the same type. Evidence comes from the summon items' `CanUseItem`, `UseItem` and `AddRecipes` methods and the parent NPCs' spawn and AI methods. The source confirms the recipe declarations and summon targets. Whether the pack allows acquisition and successful use in a particular world remains unverified.

**Unresolved catalogue bosses.** Abyssal Wraith has a separate hostile NPC and its own `EDownedBosses.downedAbyssalWraith` flag. `VoidCultist.AI` can enter Summoning when four cultists are active, `SummoningAI` creates `VoidRitualCircle`, and that projectile can create the Wraith on the server or in single-player when its countdown completes. Ordinary cultist population and the upstream trigger remain unverified. Spirit Fountain creates `SpiritRing` NPCs linked to its index, which resolves the ring as a member even though the parent's activation remains unknown. Void Pope creates two `VoidPopeHand` NPCs. Its normal entry point and any dependency on an event or special world remain unverified. These three parent records stay pending with scoped native Checklist absence.

**Other leads.** Delirium's AI and Entropy's NPC detour implement form-swapping through tagged NPCs. Its initial normal spawn remains unverified. Borrowed forms carry no additional census count. `VoidInvasion.PostUpdateEverything` drives a sky effect while active and resets progress while inactive. The normal activation, event roster and completion path remain unverified. The retained source checkout has experimental subworld references, but the pinned type table has no corresponding Entropy subworld classes. The audit does not use those checkout references to establish pack access. Entropy's `PrimordialWyrmNPC` is a town merchant whose move-in checks the Calamity Wyrm clear. It adds no boss group.

## Inheritance

The three legacy encounters have separate item-use paths that target Inheritance NPC types, owner-specific Checklist keys and their own saved flags. That supports separate variant groups alongside the original Calamity fights. In the inspected summon paths, the active-NPC guards target the legacy types. The inspected `DisableNaturalSpawn.EditSpawnPool` hook covers other natural spawns and supplies no replacement for these three.

| Variant | Normal route and progression | Related NPCs |
|---|---|---|
| Calamitas Clone Legacy | Eye of Desolation Legacy at night, with no active legacy Clone or Boss Rush. The recipe includes Essence of Havoc and Blighted Lens. Its kill handler can also set Calamity's Clone downed flag if the server enables MarkSameBossDown. | `CataclysmLegacy`, `CatastropheLegacy`, `LifeSeekerLegacy` |
| Yharon Legacy | Yharon Egg Legacy in the Jungle with no active legacy Yharon or Boss Rush. The recipe uses Effulgent Feather and Life Alloy. When `CIServerConfig.SolarEclipseChange` is on, the second stage requires `DownedBuffedSolarEclipse`. The source default is off. The inspected pack config copies supply no server override. | The same `YharonLegacy` NPC across stages, with `DetonatingFlare` as a helper |
| Supreme Calamitas Legacy | Eye of Extinction with no active legacy Supreme Calamitas. Its recipe uses legacy Auric Bars and Ashes of Calamity at the legacy Draedon's Forge. The bar recipe includes Yharon Soul Fragments. | `SupremeCataclysmLegacy`, `SupremeCatastropheLegacy`, `SoulSeekerSupremeLegacy` and the `SCalWorm` head, body, weak body, tail and heart. The legacy Calamitas town NPC can spawn after the clear. |

`CIDownedBossSystem` saves the legacy flags separately. A full legacy Yharon kill can also set Calamity's Yharon flag when the same server option is enabled. MarkSameBossDown defaults off and the inspected pack config copies supply no override. The Checklist predicate tests the legacy **P1** flag even though the key is `PostEclipseYharon`. The phase-one retreat path can set that flag before a full kill when the eclipse restriction applies. Supreme Calamitas Legacy's inspected kill handler marks its own flag. The optional progression change to Terraria's Solar Eclipse supplies no additional event group. Evidence comes from the three summon items, `AuricBarold.AddRecipes`, the boss AI and kill methods, `CIServerConfig`, `SolarEclipseChange` and `CIDownedBossSystem`.

## Boss Checklist coverage

| Canonical key | Native category | Declared NPCs | Completion flag |
|---|---|---|---|
| `CalamityEntropyLegacy AcropolisMechine` | `LogMiniBoss` | AcropolisMachine | `EDownedBosses.downedAcropolis` |
| `CalamityEntropyLegacy Apsychos` | `LogBoss` | Apsychos | `EDownedBosses.downedApsychos` |
| `CalamityEntropyLegacy Luminaris` | `LogBoss` | Luminaris | `EDownedBosses.downedLuminaris` |
| `CalamityEntropyLegacy TheProphet` | `LogBoss` | TheProphet | `EDownedBosses.downedProphet` |
| `CalamityEntropyLegacy NihilityTwin` | `LogBoss` | NihilityActeriophage, ChaoticCell | `EDownedBosses.downedNihilityTwin` |
| `CalamityEntropyLegacy Cruiser` | `LogBoss` | CruiserHead, CruiserBody, CruiserTail | `EDownedBosses.downedCruiser` |
| `CalamityInheritance CalCloneLegacy` | `LogBoss` | CalamitasCloneLegacy | `CIDownedBossSystem.DownedCalClone` |
| `CalamityInheritance PostEclipseYharon` | `LogBoss` | YharonLegacy | `CIDownedBossSystem.DownedLegacyYharonP1` |
| `CalamityInheritance Scal` | `LogBoss` | SupremeCalamitasLegacy | `CIDownedBossSystem.DownedLegacyScal` |

`CalamityEntropyLegacy.PostSetupContent` and `CIWeakReferenceSupport.AddCIBosses` require Boss Checklist to be present. Their listed entries omit `availability`, so Checklist 2.2.4 defaults each predicate to true. Gameplay members omitted from an NPC list, including both Supreme brothers, have no independent native registration in this scope. Legacy keys differ from Calamity's. The optional shared progression flags and the Yharon P1 predicate can affect completion presentation. External registration or amendments for the nine groups, final dictionary membership and book visibility remain **UNVERIFIED**.

Entropy also has a cross-owner fallback `LogBoss` for the existing **`CalamityMod PrimordialWyrm`**, with the head and three Calamity segment types, Calamity's Wyrm completion flag and default availability. It runs only when Infernum is absent. Infernum is present in the pin, and Phase 1.1B already confirmed `InfernumMode PrimordialWyrm` and its conditional visibility. This fallback adds zero groups and supplies no competing key in the audited configuration. [Phase 1.1B evidence](runtime-entries-1-1b.csv)

## Reconciliation and runtime questions

The matrix accounts for all **17** original records. Eight records establish new parent groups, six resolve as members and three remain pending. Acropolis Machine adds one group outside the original catalogue. The maintained inventory removes 14 resolved pending rows, adds nine confirmed rows and preserves the three pending parent IDs. The pending total falls from 30 to 16, including 13 untouched records outside these mods. No earlier confirmed group is reclassified.

Focused runtime work can establish normal item acquisition and spawn identity, Acropolis spawn and Signal Blocker behavior, Checklist presence and completion under the actual filters, and whether the legacy kills also update the original Calamity entries. The three pending parent bosses and the Delirium and Void Invasion leads first need a supported normal activation path. The static findings alone leave that path **UNVERIFIED**.
