# Phase 1.1A checkpoint

**The static first pass and corrections are ready for focused independent re-review.**

## Evidence reviewed

- All **71** pinned TMOD identities and SHA-256 values matched. All **71** named DLLs received a static type and IL-literal screen. The [coverage matrix](mod-coverage.csv) identifies seven targeted static reviews and gives the preliminary classification of the other 64 mods.
- Completed static review of the **registration methods** for vanilla in Boss Checklist 2.2.4, Calamity 2.2.4, Thorium 1.7.2.8 and Fargo’s Souls 1.7.3.9. The full encounter roster of each content group still needs rare-enemy, event and access-condition follow-up. No content mod has a completed in-game audit.
- FargowiltasCrossmod, FargosSoulsModDLCRecreated and CalamityFables received targeted integration checks only. Boss Checklist’s initializer and dispatcher were inspected; its actual in-game visibility was not tested.

## Results

[Encounter inventory](encounters.csv) records **131 confirmed distinct encounters or event groups**. It also retains two separately registered Acid Rain tier rows, four candidates, four excluded helpers or dummies, and 44 pending catalogue records. Confirmed distinct rows break down as 66 Terraria, 34 Calamity, 14 Thorium, 16 Fargo’s Souls, and Echdeath from Fargo’s Souls Mod DLC Recreated. The [original evidence](../encounter-catalogue.json) remains byte-identical.

The original 131 rows include **94 declarations without an identified entry-specific availability predicate, 8 declarations with one, 28 scoped standalone absences and 1 unresolved registration**. Hive Mind and the Perforators now record the callbacks evaluated after registration. The additional Infernum calls for Dreadnautilus, Primordial Wyrm and Bereft Vassal are recorded alongside the original scopes without adding rows. Bereft Vassal and Sir Nautilus retain their pending inventory status with their pinned registration leads. [Coverage and scope](coverage.md) · [Independent review](review-1-1a.md)

The inventory records canonical keys separately from vanilla initializer arguments. It identifies the Lunar Pillars as limbs, verifies the vanilla event pools for Dreadnautilus, Mothron and Goblin Warlock, and documents Patch Werk's natural Blood Moon association alongside its separate declaration. It also fixes Echdeath's directional inputs and records THE LORDE's special-seed route.

Echdeath's standalone registration and successful summoning, THE LORDE's ordinary-world access, the effective Fables replacement setting, and simultaneous Fables and Calamity display remain open. All book visibility remains **UNVERIFIED**.

## Next review

Phase 1.1B is on hold pending a focused independent re-review of these corrections. The re-review should check the corrected 131-row status split, source predicates and canonical keys, verified event relationships, Echdeath's input branches, and preservation of the 135 original NPC mappings and 44 pending records.
