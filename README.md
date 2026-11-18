# Soul of Eternity Balancing Add-on

Development repository for a custom Terraria / tModLoader compatibility add-on and its reproducible modpack baseline.

## Baseline

- Terraria **1.4.4.9** / tModLoader **2026.9.3.1**
- Maintained profile: `TodosRecuperados-Titanico-Desempenho` (71 pinned mods)
- Performance compatibility baseline: `TerrariaPackCompat` **1.2.0**
- Existing add-on foundation: `Rev8CraftingProgression` **0.8.0**, to be reviewed and extended without changing original mod binaries
- Supported local gameplay workflows: single-player client and localhost dedicated-server + client

**Publication status:** This repository is being prepared for the vetted local source, scripts, version manifests, presets and research. Do not treat the repository as a complete installation until those files are uploaded and verified.

## Planned work

1. Audit all bosses, minibosses, events and rare enemies against Boss Checklist before changing progression.
2. Review combined crafting stations, inheritance and late-game station requirements.
3. Audit the complete Soul of Eternity dependency tree, Enchantments, Forces and intermediate Souls.
4. Test recipe availability, item effects, Magic Storage, save compatibility and dedicated multiplayer.

Changes will live in a standalone add-on. Original third-party mods remain unmodified.

## Distribution and privacy

This repository is source-oriented. It must **not** include third-party `.tmod` binaries, personal campaigns (`.wld`, `.twld`, `.plr`, `.tplr`), local save directories, backups, historical archives, diagnostic traces, downloaded toolchains or machine-specific secrets. Mod binaries must be obtained through authorized distributions.

The `.gitignore` provides a first layer of protection, not a substitute for reviewing files before committing.
