# Boss Checklist audit checkpoint

## Phase 1.1C duplicate boss accessibility

**Runtime batch complete. Independent review pending.** All four bosses spawned under both replacement settings. With replacement off the usual recipes were enabled. With replacement on the original Calamity recipes were disabled, but enabled recipes convert the Fables bucket and Hookstaff into Crossmod summons. Both supplied Crossmod items spawned the originals. [Accessibility report](accessibility-1-1c.md) · [Eight-case CSV](accessibility-1-1c.csv)

Keep all four registrations for the pinned pack. Owner-qualified names and configuration-aware summon hints would clarify the duplicate labels. End-to-end item acquisition, shop routes and ambient encounters remain unverified. The next separately authorized step is the independent Phase 1.1C review using GPT-6.2 Astra with High thinking.

## Phase 1.1B runtime batch

**Independent review passed with caveats.** [Phase 1.1B review](review-1-1b.md). Tested the exact 71-package baseline and then used a private client-only probe in two configurations of the same pinned package set. All 71 package hashes matched. Tests used disposable Titanic save copies on Terraria 1.4.4.9 and tModLoader 2026.9.3.1. [Runtime report](runtime-1-1b.md) · [Scenario CSV](runtime-entries-1-1b.csv)

- All three Infernum keys, both owners’ Desert Scourge and Crabulon keys, and Fables Sir Nautilus reached the finalized dictionary. All eight were seen by name in the actual book under applicable settings.
- Dreadnautilus and Primordial Wyrm required Infernum plus Hardmode for availability. Bereft Vassal required Infernum plus the Cultist flag. The runtime report records when Hide Unavailable removed a row and when Progressive Checklist masked its name.
- Both same-name pairs appeared with Fables replacement enabled and disabled. When enabled, Fables classified the Calamity NPCs as replaced while neither checklist detour attached. Phase 1.1C tested the two pairs. Starting the Sir Nautilus duel remains unverified.
- Echdeath had no standalone finalized key or book row in the tested pack. Its successful summon remains unverified. Phase 1.1A retains the pinned summoning prerequisites.

Phase 1.1C followed the review and tested accessibility for the two duplicate pairs. [Phase 1.1C report](accessibility-1-1c.md)

## Phase 1.1A static baseline

**The corrected static first pass passed its focused independent re-review with caveats.** [Approved re-review](review-1-1a-recheck.md)

### Evidence reviewed

- All **71** pinned TMOD identities and SHA-256 values matched. All **71** named DLLs received a static type and IL-literal screen. The [coverage matrix](mod-coverage.csv) identifies seven targeted static reviews and gives the preliminary classification of the other 64 mods.
- Completed static review of the **registration methods** for vanilla in Boss Checklist 2.2.4, Calamity 2.2.4, Thorium 1.7.2.8 and Fargo’s Souls 1.7.3.9. The full encounter roster of each content group still needs rare-enemy, event and access-condition follow-up. No content mod has a completed in-game audit.
- FargowiltasCrossmod, FargosSoulsModDLCRecreated and CalamityFables received targeted integration checks only. Phase 1.1A inspected the Boss Checklist initializer and dispatcher. Phase 1.1B later tested targeted in-game visibility.

### Static results

[Encounter inventory](encounters.csv) records **131 confirmed distinct encounters or event groups**. It also retains two separately registered Acid Rain tier rows, four candidates, four excluded helpers or dummies, and 44 pending catalogue records. Confirmed distinct rows break down as 66 Terraria, 34 Calamity, 14 Thorium, 16 Fargo’s Souls, and Echdeath from Fargo’s Souls Mod DLC Recreated. The [original evidence](../encounter-catalogue.json) remains byte-identical.

The original 131 rows include **94 declarations without an identified entry-specific availability predicate, 8 declarations with one, 28 scoped standalone absences and 1 unresolved registration**. Hive Mind and the Perforators now record the callbacks evaluated after registration. The additional Infernum calls for Dreadnautilus, Primordial Wyrm and Bereft Vassal are recorded alongside the original scopes without adding rows. Bereft Vassal and Sir Nautilus retain their pending inventory status with their pinned registration leads. [Coverage and scope](coverage.md) · [Independent review](review-1-1a.md)

The inventory records canonical keys separately from vanilla initializer arguments. It identifies the Lunar Pillars as limbs, verifies the vanilla event pools for Dreadnautilus, Mothron and Goblin Warlock, and documents Patch Werk's natural Blood Moon association alongside its separate declaration. It also fixes Echdeath's directional inputs and records THE LORDE's special-seed route.

Echdeath's standalone registration and successful summoning, THE LORDE's ordinary-world access, the effective Fables replacement setting, and simultaneous Fables and Calamity display were open at the close of the static batch. All static book visibility fields were **UNVERIFIED** at that point.
