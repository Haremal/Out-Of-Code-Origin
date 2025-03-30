# TIMER
scoreboard players add @e[scores={Corruption=10..}] Timer 1
scoreboard players set @e[scores={Timer=10001..,Corruption=10..}] Timer 0
scoreboard players set @e[scores={Timer=5001..,Corruption=40..}] Timer 0
scoreboard players set @e[scores={Timer=3001..,Corruption=70..}] Timer 0
scoreboard players set @e[scores={Timer=1001..,Corruption=90..}] Timer 0
scoreboard players set @e[scores={Timer=1001..,Corruption=90..}] Timer 0
# TELEPORT
execute as @e[scores={Timer=3000..,Corruption=10..}] at @s run spreadplayers ~ ~ 0 1 false @s
execute as @e[scores={Timer=2000..,Corruption=40..}] at @s run spreadplayers ~ ~ 0 1 false @s
execute as @e[scores={Timer=1000..,Corruption=70..}] at @s run spreadplayers ~ ~ 0 1 false @s
execute as @e[scores={Timer=500..,Corruption=90..}] at @s run spreadplayers ~ ~ 0 1 false @s
execute as @e[scores={Timer=200..,Corruption=100..}] at @s run spreadplayers ~ ~ 0 1 false @s
# DEBUFFS
attribute @e[limit=1,scores={Corruption=10..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174001 "Corruption1" -0.1 multiply
attribute @e[limit=1,scores={Corruption=20..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174002 "Corruption2" -0.12 multiply
attribute @e[limit=1,scores={Corruption=30..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174003 "Corruption3" -0.13 multiply
attribute @e[limit=1,scores={Corruption=40..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174004 "Corruption4" -0.15 multiply
attribute @e[limit=1,scores={Corruption=50..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174005 "Corruption5" -0.17 multiply
attribute @e[limit=1,scores={Corruption=60..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174006 "Corruption6" -0.2 multiply
attribute @e[limit=1,scores={Corruption=70..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174007 "Corruption7" -0.25 multiply
attribute @e[limit=1,scores={Corruption=80..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174008 "Corruption8" -0.33 multiply
attribute @e[limit=1,scores={Corruption=90..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174009 "Corruption9" -0.5 multiply
# KILL
kill @e[scores={Corruption=100..}]