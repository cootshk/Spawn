scoreboard players set @s Spawn 0
execute unless score AllowTeleportInCombat SpawnSettings matches 1 if score @s IsInCombat matches 1 run tellraw @s ["", {"text": "[", "color": "gold"}, {"text": "CombatLog", "color": "red"}, {"text": "] ", "color": "gold"}, {"text": "You cannot warp while you are in combat!", "color": "red"}]
execute unless score AllowTeleportInCombat SpawnSettings matches 1 if score @s IsInCombat matches 1 run return 0
$tp @s $(X) $(Y) $(Z)
execute at @s if score PlaySound SpawnSettings matches 1 run playsound minecraft:entity.player.teleport master @s ~ ~ ~ 1 1 1
execute if score ShowTeleportMessage SpawnSettings matches 1 run tellraw @s {"storage":"cootshk:spawn", "nbt": "TeleportMessage", "interpret": true}
#[{"text": "[", "color": "gold"}, {"text": "Spawn", "color": "green"}, {"text": "] ", "color": "gold"}, {"text": "You have been teleported to spawn!", "color": "yellow"}]
