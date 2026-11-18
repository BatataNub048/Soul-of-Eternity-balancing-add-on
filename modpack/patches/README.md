# Redistributable compatibility patches

Each diff is the maintained project's local change against the listed upstream commit. Obtain the upstream source from the maintainer and keep its license and notices with any derived build. These packages remain separate inputs to the profile.

| Patch | Upstream commit | Notice |
|---|---|---|
| [CalamityOverhaul.patch](CalamityOverhaul.patch) | [hocha113/CalamityOverhaul at 8d2bd38](https://github.com/hocha113/CalamityOverhaul/tree/8d2bd38f268239dab6f05f78061e732eb24b423a) | [Upstream MIT notice](notices/CalamityOverhaul.txt) |
| [Munchies_CalamityAddon.patch](Munchies_CalamityAddon.patch) | [jbossjaslow/MunchiesCalamityAddon at 7717db3](https://github.com/jbossjaslow/MunchiesCalamityAddon/tree/7717db3c8996b14e24532eb993b7945708af4d7b) | [Upstream MIT notice](notices/Munchies_CalamityAddon.txt) |

In a separate upstream checkout at the pinned commit, run `git apply --check <patch-file>`, then `git apply <patch-file>`. Stage the patched tree under its original internal mod name in a disposable tModLoader build profile. Build with **2026.9.3.1** and the reference versions in the [maintained lock](../profiles/TodosRecuperados-Titanico-Desempenho.lock.json). The exact digest is enforced during profile setup. A new build can have a different digest.

The Census, Calamity's Vanities, Calamity Entropy Legacy and TitanWorlds diffs are outside publication because redistribution permission for their third-party portions was not confirmed. [Current baseline and reproducibility limits](../../docs/compatibility.md)
