# Prepare and launch the Titanic profile

Use Windows PowerShell 5.1, Terraria **1.4.4.9** and tModLoader **2026.9.3.1**. Start tModLoader once to prepare its runtime, then close the game before preparing this profile. [Pinned release](https://github.com/tModLoader/tModLoader/releases/tag/v2026.09.3.1)

## Obtain the pinned payload

The [profile lock](../modpack/profiles/TodosRecuperados-Titanico-Desempenho.lock.json) lists the full internal mod names, versions, sources, dependency metadata and SHA-256 values for 71 mods. The entries marked `workshop` link to the publishers' Workshop distributions. Obtain the 63 Workshop builds separately through Steam or from versioned releases supplied by their authors. If a distribution now serves a different binary, obtain the audited version from an authorized source.

The eight entries marked `bundled` describe the historical local baseline. Their binaries are separate inputs to this repository. For local build options, licensed patches and missing private port sources, see [Compatibility and rebuilds](compatibility.md).

Create a local `modpack/payload` directory. Place each package at the lock entry's `payloadFile` path relative to that directory. If no `payloadFile` is set, use `<internal-name>.tmod`. For example, put the exact TerrariaPackCompat build at `payload/variants/TerrariaPackCompat/1.2.0/TerrariaPackCompat.tmod`. Prepare the pack from the recorded versions and hashes. A local rebuild can produce a new digest, even when its internal version matches.

From the `modpack` directory, run the following in Windows PowerShell 5.1.

~~~powershell
.\Preparar-Desempenho.ps1
.\Executar-Perfil.ps1 -Modo Verificar
.\tests\Test-Titanico.ps1
~~~

Preparation verifies the package versions, SHA-256, enabled list, dependencies and Titanic config. It writes a local save root with the audited presets.

## Single-player

Run `JOGAR-SINGLEPLAYER.bat` from `modpack`. Choose or create your own player and world in the game. Keep each world with its `.twld` sidecar, each character with its `.tplr` sidecar, and any mod-owned data with that campaign.

## Local dedicated server

The maintained launcher uses `GigaWorldModded` and `GigaModded` as its world and player file basenames. On a clean checkout, prepare your own disposable world and character with those basenames in the solo save root first. Use the game's create or import workflow and preserve both files of each save pair. A separately obtained compatible save set can also be supplied under the required basenames with its sidecars. The checkout contains no campaign data.

Close the game and run `JOGAR-SERVIDOR-LOCAL.bat`. On the first run the launcher seeds its independent server save root from the prepared solo profile. It verifies the world identity and mod set, opens `127.0.0.1:17789`, and starts one local client. Future launches use that independent server campaign. The solo and server Mods copies remain distinct.

Use **Save & Exit** in the client, then type `exit` in the server console and let the save finish. Use the in-game reconnect option or `JOGAR-NO-SERVIDOR-LOCAL.bat` when the dedicated server is already listening. `INICIAR-SERVIDOR-LOCAL.bat` starts the dedicated server alone.

Both launchers can use `-PastaTml` to specify a local folder containing `tModLoader.dll` when the Steam installation cannot be detected.
