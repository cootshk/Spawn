##
 # reset.mcfunction
 # spawn
 #
 # Created by Cootshk.
##

scoreboard objectives add SpawnCoords dummy
scoreboard objectives add Spawn trigger
scoreboard objectives add SetSpawn trigger
scoreboard objectives add SpawnSettings dummy
scoreboard objectives add SpawnConfig trigger

# Datapack compat
scoreboard objectives add IsInCombat dummy

# Default Values
execute unless score HasInitialized SpawnSettings matches 1 run function cootshk:spawn/setdefaultvalues