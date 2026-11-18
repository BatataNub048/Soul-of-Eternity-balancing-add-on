# Standalone add-on development

[Rev8CraftingProgression 0.8.0](../addon/Rev8CraftingProgression/) is the verified starting point for the Soul of Eternity work. Keep the internal mod name and content IDs stable. The folder contains the build metadata and the complete source for the Woodland Bundle, combined crafting stations and guarded recipe changes. The mod resolves textures from Terraria at runtime.

1. Use Terraria **1.4.4.9** and tModLoader **2026.9.3.1** with Magic Storage, Fargowiltas, FargowiltasSouls and CalamityMod from authorized distributions. Match the [baseline lock](../modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json) for reproduction. The build metadata also specifies ordering for the supported Fargo integrations.
2. Copy the complete `Rev8CraftingProgression` folder to ModSources in an isolated tModLoader development profile, then use **Workshop → Develop Mods → Build**. Keep the built package in the test profile.
3. Compare against the maintained baseline using disposable worlds and players. Check recipe conditions, quantities and alternative crafting routes, the retained original item effects, and combined station inheritance both in the world and through Magic Storage.
4. When testing a candidate, check single-player save and reload, then test the same add-on version on the client and loopback dedicated server. Keep produced binaries and diagnostic data local.

The 0.8.0 reports cover Woodland Bundle, station inheritance, the tested early enchantment routes and the final Tier 1 C3 Pumpkin validation. [Crafting research and test reports](../research/crafting/README.md)

Rev9 work remains planned. The next investigations are encounter classification against Boss Checklist and the complete Soul of Eternity dependency tree. Validate progression gates before making gameplay changes. [Rev9 plan](../research/crafting/implementation-plan.md) · [Observed Soul of Eternity recipe graph](../research/fargo/soul-of-eternity-recipes.json)
