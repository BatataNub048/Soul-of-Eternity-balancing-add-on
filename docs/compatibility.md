# Compatibility and rebuilds

## Implemented and verified

- **TerrariaPackCompat 1.2.0** keeps the Whips banner association fix, pooled music tile lists, Fargo candle filtering, stable Ragnarok difficulty hooks, an empty Calamity polarity draw guard and cached live music lookups. The source and English localization are in [the versioned source tree](../modpack/source/variants/TerrariaPackCompat-1.2.0/TerrariaPackCompat/).
- **TerrariaPackGuard 1.0.0** skips grass seed drops during dedicated world generation to avoid accessing an uninitialized local player while Fargo places a statue. Normal tile drops use the existing path. [Guard source](../modpack/source/TerrariaPackGuard/)
- **Rev8CraftingProgression 0.8.0** contains the audited Woodland Bundle and station and crafting changes. The add-on uses Terraria-provided texture references at runtime. [Development guide](development.md)
- The TitanWorlds **1.15.16.1** local port fixes Titanic dimensions for new dedicated-world generation by setting the existing generation scope before world initialization. The standalone [world-safety tests](../modpack/tests/Test-Titanico.ps1) cover normal, Titanic, unsupported expanded and truncated world fixtures.

## The eight local builds

| Locked package | Source or build availability |
|---|---|
| TerrariaPackCompat 1.2.0 | Complete locally authored source and rebuild wrapper included. |
| TerrariaPackGuard 1.0.0 | Complete locally authored source included. Build with the pinned Thorium and Fargo's Souls references named in its build metadata. |
| Calamity Overhaul 0.9209.2 | [Local patch](../modpack/patches/CalamityOverhaul.patch) and upstream MIT notice. Maintains SelfRig priority and handles shared armor variants in GodSmith. |
| Munchies Calamity Addon 1.3.1.1 | [Local patch](../modpack/patches/Munchies_CalamityAddon.patch) and upstream MIT notice. Registers current Calamity permanent consumables and uses the corresponding API. |
| Census 0.5.2.9 | The local port preserves the legacy registered NPC condition and reports success to LuiAFK. Private patch. |
| Calamity's Vanities 11.4.2.1 | The local port updates calls for damage reduction and defense. Private patch. |
| Calamity Entropy Legacy 3.39.1 | The local port addresses shader asset injection and particle initialization. Private patch. |
| TitanWorlds 1.15.16.1 | Local dedicated-world generation port. Extracted vendor code, assets and derivative patch remain private. |

The two published patches passed `git apply --check` against the exact upstream sources. [Pinned commits, notices and apply steps](../modpack/patches/README.md)

## Rebuild local code

To reproduce the maintained TerrariaPackCompat build procedure with the audited inputs already present, run `Reconstruir-Compat-Desempenho.ps1` from `modpack`. It stages a separate build directory from the pinned payload, keeps the audited input as a reference, and builds the included 1.2.0 source with the matching tModLoader. The staged output stays outside the runtime payload.

For a first development build, use a separate tModLoader build profile and obtain the required references from their authorized distributions. Copy the complete source folder to that profile's ModSources tree, preserving its basename, then use **Workshop → Develop Mods → Build**. The build metadata records the required or weak references. This path also builds TerrariaPackGuard from its source folder.

Compare rebuilt packages with the pinned SHA-256 before attempting to use them with the maintained lock. Build metadata and compiler environment can change a package digest. The exact baseline still requires separately obtained audited binaries for all 71 entries, including the private ports. The public tree supplies definitions, code, patches and documentation for the portions listed above.
