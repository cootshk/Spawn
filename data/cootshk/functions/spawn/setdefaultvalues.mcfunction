scoreboard players set UseFloat SpawnSettings 0
scoreboard players set ShowTeleportMessage SpawnSettings 0
data modify storage cootshk:spawn TeleportMessage set value [{"text": "[", "color": "gold"}, {"text": "Spawn", "color": "green"}, {"text": "] ", "color": "gold"}, {"text": "You have been teleported to spawn!", "color": "yellow"}]
scoreboard players set PlaySound SpawnSettings 0
scoreboard players set AllowTeleportInCombat SpawnSettings 0

scoreboard players set HasInitialized SpawnSettings 1