##
 # main.mcfunction
 # spawn
 #
 # Created by Cootshk.
##


# Run /function cootshk:spawn/setspawn to set the spawn point.
#execute as @a[gamemode=creative] run scoreboard players enable @s SetSpawn
#execute as @a unless score @s SetSpawn matches 0 run function cootshk:spawn/setspawn

scoreboard players enable @a Spawn
execute as @a unless score @s Spawn matches 0 run function cootshk:spawn/warp with storage cootshk:spawn