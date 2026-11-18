# Phase 1.1A checkpoint

**Completed the static first pass. The full encounter inventory and in-game Boss Checklist audit remain open.**

## Evidence reviewed

- All **71** pinned TMOD identities and SHA-256 values matched. All **71** named DLLs received a static type and IL-literal screen. The [coverage matrix](mod-coverage.csv) identifies seven targeted static reviews and gives the preliminary classification of the other 64 mods.
- Completed static review of the **registration methods** for vanilla in Boss Checklist 2.2.4, Calamity 2.2.4, Thorium 1.7.2.8 and Fargo’s Souls 1.7.3.9. The full encounter roster of each content group still needs rare-enemy, event and access-condition follow-up. No content mod has a completed in-game audit.
- FargowiltasCrossmod, FargosSoulsModDLCRecreated and CalamityFables received targeted integration checks only. Boss Checklist’s initializer and dispatcher were inspected; its actual in-game visibility was not tested.

## Results

[Encounter inventory](encounters.csv) records **131 confirmed distinct encounters or event groups**. It also retains two separately registered Acid Rain tier rows, four candidates, four excluded helpers or dummies, and 44 pending catalogue records. Confirmed distinct rows break down as 66 Terraria, 34 Calamity, 14 Thorium, 16 Fargo’s Souls, and Echdeath from Fargo’s Souls Mod DLC Recreated. The [original evidence](../encounter-catalogue.json) remains byte-identical.

The 131 rows include 96 confirmed source registrations, six conditional entries, 28 scoped standalone absences, and one unresolved registration. The primary coverage gaps are vanilla Dreadnautilus, Mothron and Goblin Warlock in the built-in register, and Primordial Wyrm in Calamity’s own register. Treat these as review leads until external registration and event associations are checked. Echdeath registration remains unresolved. Calamity and Fables Desert Scourge and Crabulon are possible overlaps. Worm segments, secondary forms, helpers and the Thorium boss dummy are grouped or excluded as described in [coverage](coverage.md).

All book visibility remains **UNVERIFIED**. No gameplay, Boss Checklist, addon, progression or configuration source was edited.

## Exact next batch

First, independent review of Phase 1.1A by GPT-6.2 Astra with High thinking. Review the source-registration counts, helper deductions, and Fables signature finding against the pinned assemblies.

After review and separate authorization, **Phase 1.1B** should be a bounded follow-up on Calamity, Thorium and Fargo’s Souls: verify access and configuration predicates for Primordial Wyrm, THE LORDE, Thorium’s three registered minibosses, Fargo’s Champions and Echdeath. Reconcile pending rare enemies and non-boss-flag events for those three origins from spawn and event code. Check the two Fables overlaps against the installed replacement setting and, if required, an isolated disposable profile. Record any book observation separately from static registration. Leave the remaining content-mod catalogue grouping to a later batch.
