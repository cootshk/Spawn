scoreboard players set @s SetSpawn 0
execute if entity @s[gamemode=!creative] run tellraw @s ["",{"text": "[", "color": "gold"}, {"text": "Spawn", "color": "green"}, {"text": "] ", "color": "gold"}, {"text": "You must be in creative mode to run /trigger SetSpawn!", "color": "red"}, "\n", {"text": "[", "color": "gold"}, {"text": "Spawn", "color": "green"}, {"text": "] ", "color": "gold"}, {"text": "You can use ", "color": "yellow"}, {"text": "/function #cootshk:setspawn", "clickEvent":{"action": "run_command", "value": "/function #cootshk:setspawn"}, "value": "/function cootshk:spawn/setspawn", "color": "green", "underlined": true}, {"text": " to set the spawn point.", "color": "yellow"}]
execute if entity @s[gamemode=!creative] run return 1
function cootshk:spawn/setspawn