# CREATION
scoreboard players set ClonesExist Timer 0
execute store result score ClonesCount Timer run execute if entity @e[tag=CORR_CLONE]
execute unless score ClonesCount Timer matches 3.. run summon minecraft:armor_stand ~ ~ ~ {Tags:["NAN","CORR_CLONE"],NoBasePlate:true,ArmorItems:[{id:"chainmail_boots",Count:1},{id:"chainmail_leggings",Count:1},{id:"chainmail_chestplate",Count:1},{id:"chainmail_helmet",Count:1}]}
# POS AND ROT
spreadplayers ~ ~ 1 1 false @e[tag=CORR_CLONE]
execute as @e[tag=CORR_CLONE] run data modify entity @s Rotation set from entity @e[tag=CORR,limit=1] Rotation
execute as @e[tag=CORR_CLONE] run data modify entity @s Pos[1] set from entity @e[tag=CORR,limit=1] Pos[1]
# DISTORTING
tag @e[tag=!NAN,distance=..15,nbt={Brain:{}}] add DISTORTED
tag @e[tag=!NAN,distance=16..,nbt={Brain:{}}] remove DISTORTED
function corr:origin/out_of_code/color_changing
