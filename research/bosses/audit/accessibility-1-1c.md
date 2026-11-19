# Phase 1.1C duplicate boss accessibility

Phase 1.1B established that both entries for each boss appear in the open book with Fables replacement enabled and disabled. This batch links those keys to actual spawns and checks how players can obtain the summon items. [Runtime visibility](runtime-1-1b.md#L19) · [Independent review](review-1-1b.md)

**All four encounters are accessible in both configurations.** With replacement off, the usual summon items have enabled recipes. With replacement on, the original Calamity recipes are disabled, but work-bench conversions make Crossmod summons for both original bosses. Keep all four checklist entries for this pack. [Eight-case evidence CSV](accessibility-1-1c.csv)

## Test setup

The measured clients used Terraria 1.4.4.9, tModLoader 2026.9.3.1, Calamity 2.2.4, Fables 0.1.24, the 71 packages already hash-verified for these disposable profiles, and one private client-only diagnostic mod. The profiles used separate Pre-Hardmode copies of the same local Titanic world and character. The reload-required `ReplaceCalamity` value was set before each launch and recorded in the loaded world. The diagnostic moved the player to existing terrain, supplied legitimate items, pulsed normal item-use input, and recorded recipe state and NPC spawn events. It did not directly spawn NPCs, edit terrain or set progression flags. No boss kills were required. The acquisition evidence below comes from the pack's finalized recipe table and pinned code. Gathering, crafting and shop purchases were separate from the instrumented item-use tests. [Package lock](../../../modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json)

## Triggers and requirements

| Checklist key | Trigger and live gates | Direct acquisition source |
|---|---|---|
| `CalamityMod DesertScourge` | Use Desert Medallion with `ZoneDesert` true, no original Desert Scourge head, and Boss Rush inactive. | The pack's direct recipe uses 10 sand (Sand group), 2 Antlion Mandibles, 1 Calamity Stormlion Mandible, and 5 Thorium Sandstone Ingots at an altar. A work bench conversion from the Crossmod medallion also takes 5 Sandstone Ingots. |
| `CalamityFables DesertScourge` | Use the Stormlion Grub Bucket in the surface Desert. It releases a Dead Stormlion Larva. A nearby living player in the surface Desert and line of sight let the larva attract the boss. An active Fables Scourge or Scarabeus stalls attraction. The bucket can produce Fibsh instead on a rare roll or in the special-seed branch. | Craft an Empty Bucket and 5 Dead Stormlion Larvae without a station. The living larva naturally spawns under its desert spawn conditions and can be caught or killed for the respective larva item. The dead larva used here avoids the living larva's defeated-boss restriction. |
| `CalamityMod Crabulon` | Use Decapodita Sprout in a Glowing Mushroom biome below `Main.worldSurface`, with no original Crabulon and Boss Rush inactive. | The pack's direct recipe uses 25 Glowing Mushrooms at an altar. A work bench conversion also takes Crossmod's Ophiocordycipitaceae Sprout. |
| `CalamityFables Crabulon` | Use Hookstaff with unactuated Mushroom Grass under the forward foot in an underground Glowing Mushroom biome, no Fables Crabulon, and an idle summon timer. The timer spawns the boss after about 120 updates. | Craft a Hook, 5 iron-group bars, and 30 Glowing Mushrooms at an anvil. The deterministic Hookstaff route was tested. The ambient cave route mentioned in the book remains unverified. |

Source methods include `DesertMedallion.CanUseItem`, `DecapoditaSprout.CanUseItem`, `BucketOfLarvae.SpawnedNPC`, `StormlionLarva.PreAI`, and `Hookstaff.CanUseItem`, `UseItem` and `UpdateCrabulonSpawn`. The costs above reflect the loaded pack recipes, including its compatibility changes.

## Results

| Boss Checklist key | Observed NPC | Replacement on | Replacement off | Checklist recommendation |
|---|---|---|---|---|
| `CalamityMod DesertScourge` | `CalamityMod/DesertScourgeHead` (792) | ACCESSIBLE THROUGH SPECIAL ROUTE | PLAYABLE THROUGH NORMAL ROUTE | Keep in both settings |
| `CalamityFables DesertScourge` | `CalamityFables/DesertScourge` (1418) | PLAYABLE THROUGH NORMAL ROUTE | PLAYABLE THROUGH NORMAL ROUTE | Keep in both settings |
| `CalamityMod Crabulon` | `CalamityMod/Crabulon` (772) | ACCESSIBLE THROUGH SPECIAL ROUTE | PLAYABLE THROUGH NORMAL ROUTE | Keep in both settings |
| `CalamityFables Crabulon` | `CalamityFables/Crabulon` (1424) | PLAYABLE THROUGH NORMAL ROUTE | PLAYABLE THROUGH NORMAL ROUTE | Keep in both settings |

The CSV records the intended-route spawn times for both settings. The IDs match across runs and map to the Phase 1.1B keys. The Fables bucket first spawns a Dead Stormlion Larva (1417), then the boss (1418). With replacement off, the Desert Medallion also has an enabled altar recipe using one Fables Electrocells in place of the Stormlion Mandible. [Phase 1.1B NPC identities](runtime-entries-1-1b.csv#L24) · [Spawn matrix](accessibility-1-1c.csv)

### Crossmod routes with replacement on

| Enabled work-bench conversion | Spawn from the supplied output item | 19 November 2026 BRT |
|---|---|---|
| One Stormlion Grub Bucket → one Crossmod Medallion of the Desert (`FargowiltasCrossmod/MedallionoftheDesert`) | `CalamityMod/DesertScourgeHead` (792) in the surface Desert | 00:29:16.749 |
| One Hookstaff → one Crossmod Ophiocordycipitaceae Sprout (`FargowiltasCrossmod/OphiocordycipitaceaeSprout`) | `CalamityMod/Crabulon` (772) in the underground Glowing Mushroom biome | 00:29:27.192 |

Both conversions had no extra recipe conditions. Both Fables inputs had enabled recipes. The loaded copy also contained 19 single-bucket chest slots and no matching original summon items in its chests. Newly generated worlds were outside this scan. With replacement off, both Crossmod conversions were present as additional recipes alongside the variants using the original Calamity items.

**ACCESSIBLE THROUGH SPECIAL ROUTE** identifies an enabled Crossmod conversion and successful alternate item use while the original item's recipes are disabled. The conversion uses ordinary crafting. **PLAYABLE THROUGH NORMAL ROUTE** identifies the boss's usual craftable item and intended summon trigger. End-to-end gathering and crafting remain **UNVERIFIED** because the probe supplied the tested items. No crash or redirection occurred in the recorded trials. Combat completion, multiplayer, and shop and ambient spawn alternatives remain unverified.

## What replacement changes

`ParasiteCoreSystem.SetStaticDefaults` builds item mappings from `ReplacingCalamity` attributes. For these two summons, the mapped items are Desert Medallion → Stormlion Grub Bucket and Decapodita Sprout → Hookstaff. With replacement on, `PostAddRecipes` disables recipes whose output is a replaced Calamity item and rewrites replaced ingredients in other recipes. With replacement off, it keeps the originals and clones recipes when it can substitute a Fables ingredient.

Fables also maps the NPC types. Its `EditSpawnPool` zeros the weights of replaced Calamity NPCs in the natural spawn pool with replacement on. Its `NPC.NewNPC` hook blocks the types on the replaced **town NPC** list. Neither is a general prohibition on spawning the original bosses through summon items. In the measured client, both supplied original items still invoked their native summons with replacement on. Their NPCs kept the Calamity identity. Fables's mapping of the summon items acts at acquisition and recipe integration points and did not redirect the use of an original item already held.

Fargo's Crossmod declares its own Medallion of the Desert and Ophiocordycipitaceae Sprout. The first uses `MedallionoftheDesert.Shoot` to request the original Calamity head. The second uses Fargo's `BaseSummon.Shoot` and the original Calamity Crabulon as its target. Crossmod also declares Mutant shop entries gated by Calamity's downed flags. The Fables defeat setters write the corresponding Calamity properties when found. That provides a source-level explanation for a possible shop route after a Fables victory. Shop availability and purchases were unverified. Calamity has a world-generation chest route for Desert Medallion. A chest scan of the copied world is separate from testing generation under a new configuration.

Phase 1.1B documented that the intended checklist suppression hooks fail to attach because of an incompatible method signature. Phase 1.1C shows why that mismatch does not justify hiding either Calamity row when replacement is on. Owner-qualified display names and configuration-aware summon hints could distinguish the two fights and show the available items. For the maintained pack, evaluate the routes that remain available when deciding checklist visibility. [Hook mismatch](review-1-1a-recheck.md#corrections-checked-against-the-pins) · [Confirmed duplicate labels](runtime-1-1b.md#L19)

## Resume checkpoint

- **Completed and verified at handoff.** Phase 1.1B visibility, all four replacement-on item spawns, and the four items' loaded recipe states. In the initial Hookstaff attempt the forward foot was over tile type 0. That attempt was excluded. The retry used Mushroom Grass (tile 70) and spawned Fables Crabulon.
- **Completed but evidence insufficient at handoff.** An early replacement-off launch from a shared package path loaded only the built-in loader. It yielded no encounter evidence. The separate off profile already contained the full package set.
- **Not started or undocumented at handoff.** Valid off trials, live Crossmod alternate-recipe and item-use checks with replacement on, and the publication files.
- **Blocked at handoff.** None for the eight-case matrix. The matching worlds, profiles, sources and compiled diagnostics were reusable.
