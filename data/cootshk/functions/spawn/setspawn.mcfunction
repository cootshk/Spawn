#execute store result score X SpawnCoords run data get entity @s Pos[0] 1
#execute store result score Y SpawnCoords run data get entity @s Pos[1] 1
#execute store result score Z SpawnCoords run data get entity @s Pos[2] 1
execute if score UseFloat SpawnSettings matches 1 store result storage cootshk:spawn X float 1.0 run data get entity @s Pos[0] 1
execute if score UseFloat SpawnSettings matches 1 store result storage cootshk:spawn Y float 1.0 run data get entity @s Pos[1] 1
execute if score UseFloat SpawnSettings matches 1 store result storage cootshk:spawn Z float 1.0 run data get entity @s Pos[2] 1
execute unless score UseFloat SpawnSettings matches 1 store result storage cootshk:spawn X int 1.0 run data get entity @s Pos[0] 1
execute unless score UseFloat SpawnSettings matches 1 store result storage cootshk:spawn Y int 1.0 run data get entity @s Pos[1] 1
execute unless score UseFloat SpawnSettings matches 1 store result storage cootshk:spawn Z int 1.0 run data get entity @s Pos[2] 1

tellraw @s ["", {"text": "[", "color": "gold"}, {"text": "Spawn", "color": "green"}, {"text": "] ", "color": "gold"}, {"text": "Set the spawn point to your current location (", "color": "yellow"}, {"nbt": "X", "storage": "cootshk:spawn", "interpret": false, "color": "aqua", "bold": false}, {"text": ", ", "color": "yellow"}, {"nbt": "Y", "storage": "cootshk:spawn", "interpret": false, "color": "aqua", "bold": false}, {"text": ", ", "color": "yellow"}, {"nbt": "Z", "storage": "cootshk:spawn", "interpret": false, "color": "aqua", "bold": false}, {"text": ")", "color": "yellow"}]
scoreboard players set @s SetSpawn 0