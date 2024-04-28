scoreboard players set @s Spawn 0
execute if score @s IsInCombat matches 1 run tellraw @s ["", {"text": "[", "color": "gold"}, {"text": "CombatLog", "color": "red"}, {"text": "] ", "color": "gold"}, {"text": "You cannot warp while you are in combat!", "color": "red"}]
execute if score @s IsInCombat matches 1 run return 0
$tp @s $(X) $(Y) $(Z)