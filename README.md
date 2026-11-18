# Soul of Eternity Balancing Add-on

Development repository for a custom Terraria / tModLoader compatibility add-on and its reproducible modpack baseline.

## Verified baseline

- Terraria **1.4.4.9** and stable tModLoader **2026.9.3.1**. [Pinned tModLoader release](https://github.com/tModLoader/tModLoader/releases/tag/v2026.09.3.1)
- Maintained profile **TodosRecuperados-Titanico-Desempenho**, with [71 pinned mods](modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json), TitanWorlds **1.15.16.1** and TerrariaPackCompat **1.2.0**.
- Standalone add-on foundation **Rev8CraftingProgression 0.8.0**, including the Woodland Bundle and combined crafting stations. The add-on is outside the 71-mod runtime selection.
- Verified local workflows include single-player save and reload and a loopback dedicated server with client reconnection. [Compatibility and test findings](research/multiplayer/local-findings.md)

This is a source and reference repository. A playable setup requires a licensed Terraria installation, tModLoader, and the exact mod binaries obtained separately. Several locked builds are local ports. The Workshop versions alone do not complete the baseline. [Payload and setup guide](docs/setup.md)

## Setup

1. Obtain the third-party mods through their authorized distributions and populate `modpack/payload` using the version, SHA-256 and path in the lock. [Local builds and redistribution](docs/compatibility.md)
2. From `modpack`, run `Preparar-Desempenho.ps1` in Windows PowerShell 5.1. Run `Executar-Perfil.ps1 -Modo Verificar` to check the prepared profile.
3. Open `JOGAR-SINGLEPLAYER.bat` and choose a local world and character.
4. For localhost multiplayer, prepare the campaign inputs listed in the setup guide, then open `JOGAR-SERVIDOR-LOCAL.bat`. The dedicated server listens on `127.0.0.1:17789` and keeps independent save and Mods directories.

## Development

- [modpack/](modpack/) contains the manifest, launchers, configuration presets, compatibility sources and the [Titanic world-safety test](modpack/tests/Test-Titanico.ps1).
- [addon/](addon/) contains the standalone Rev8CraftingProgression source and tModLoader build metadata.
- [research/](research/) contains observed encounter and recipe data, progression investigations, and local multiplayer findings.
- [docs/](docs/) contains setup, rebuild and development instructions.

The verified compatibility baseline includes the world-generation guard, Whips banner fix and measured performance fixes. The existing standalone add-on preserves original item IDs, effects and native recipe routes for its tested changes. [Implemented changes and rebuild instructions](docs/compatibility.md)

## Planned work

1. Audit bosses, minibosses, events and rare enemies against Boss Checklist before changing progression.
2. Review combined crafting stations, inheritance and late-game station requirements.
3. Audit the complete Soul of Eternity dependency tree, Enchantments, Forces and intermediate Souls.
4. Test recipe availability, item effects, Magic Storage, save compatibility and dedicated multiplayer.

Future changes belong in the standalone add-on. [Build and test the add-on](docs/development.md) · [Rev9 implementation plan](research/crafting/implementation-plan.md)

## Distribution and privacy

The repository includes project-authored source, small factual datasets and the two compatibility patches with verified upstream notices. The [compatibility guide](docs/compatibility.md) records the ports whose source is withheld. Third-party binaries, player data, machine-specific diagnostics, historical archives and recovery backups are outside the publication scope. Use a positive file allowlist when staging releases.
