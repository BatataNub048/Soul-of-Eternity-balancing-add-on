# Local multiplayer findings

The maintained workflow was verified on Terraria **1.4.4.9** and tModLoader **2026.9.3.1** using disposable Titanic world and player copies. The server listened on `127.0.0.1:17789`, the client connected with the locked mods, and normal save, shutdown, reload and reconnection passed. Inventory, progression and mod sidecars were checked after reload. Subworld Library may start one helper process alongside the dedicated server.

The client discovers mods under the Mods directory of its selected save root. Passing a separate `-modpath` did not give the client the server's mod selection in the shared-folder trial. The maintained launcher uses one independent multiplayer save root for client and server, with the same pinned manifest as solo play.

Infernum emitted its multiplayer warning, InnoVault's scenario director stayed offline in multiplayer, and a packet read underflow from Better Zenith in Calamity was logged. The observed connection and save checks completed. Individual encounters and mod mechanics still need dedicated tests.

The retired Vanity experiment reproduced a projectile spam disconnect. The finding was scoped to the old private profile. The maintained launcher and verified 71-mod workflow are described in the [setup guide](../../docs/setup.md).
