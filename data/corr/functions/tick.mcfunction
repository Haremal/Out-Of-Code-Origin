# SELF
tag @a[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add CORR
tag @a[tag=CORR] add NAN
# scoreboard players set @a[tag=CORR] Corruption 100
scoreboard players add @e[tag=NAN,type=!player] Timer 1

# NAN NERVES
    # SPREAD
    execute store result score NAN_TOPS_COUNT Timer run execute if entity @e[tag=NAN_TOP]
    execute store result score NAN_BOTTOMS_COUNT Timer run execute if entity @e[tag=NAN_BOTTOM]
    execute at @e[tag=CORR_NERVES] unless score NAN_TOPS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~20 ~ {Invisible:true,NoGravity:true,Tags:["NAN_TOP","CORR_NERVES_ENDS","NAN"]}
    execute at @e[tag=CORR_NERVES] unless score NAN_BOTTOMS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~-20 ~ {Invisible:true,NoGravity:true,Tags:["NAN_BOTTOM","CORR_NERVES_ENDS","NAN"]}
    execute at @e[tag=CORR_NERVES] run spreadplayers ~ ~ 15 20 false @e[tag=CORR_NERVES_ENDS]
    execute as @e[tag=CORR_NERVES_ENDS] run data modify entity @s Pos[1] set from entity @e[tag=CORR_NERVES,limit=1] Pos[1]
    execute as @e[tag=NAN_TOP,type=armor_stand] at @s run tp @s ~ ~20 ~
    execute as @e[tag=NAN_BOTTOM,type=armor_stand] at @s run tp @s ~ ~-20 ~
    execute at @e[tag=NAN_TOP] run summon minecraft:block_display ~ ~-100 ~ {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,40f]},block_state:{Name:"purple_wool"},NoGravity:1b,Tags:["NAN_DYING","NAN"]}
    execute as @e[tag=NAN_DYING,scores={Timer=..1}] at @s run tp @s ~ ~100 ~ facing entity @e[tag=NAN_BOTTOM,limit=1,sort=random] feet
    execute at @e[tag=CORR_NERVES] positioned ~ ~5 ~ run tag @e[distance=..20,tag=!NAN,type=!item] add NAN_BOTTOM
    execute at @e[tag=CORR_NERVES] positioned ~ ~5 ~ run execute at @e[tag=!NAN,distance=..20,type=!item] run execute unless entity @e[tag=NAN_STOP,distance=..1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,Tags:["NAN_STOP","NAN"]}
    execute as @e[tag=NAN_STOP,scores={Timer=..1}] at @s run data modify entity @s Rotation set from entity @e[tag=!NAN,distance=..1,limit=1,sort=nearest] Rotation
    execute as @e[tag=NAN_STOP,scores={Timer=2..}] at @s run tp @e[tag=!NAN,distance=..1] @s
    # SPREAD_REMOVE
    kill @e[tag=NAN_DYING,scores={Timer=150..}]
    kill @e[tag=REMOVE,limit=30]
    execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_STOP,distance=21..,limit=1]
    execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_DYING,scores={Timer=5..},distance=35..]
    execute at @e[tag=CORR_NERVES] positioned ~ ~5 ~ run tag @e[distance=20..,tag=!NAN] remove NAN_BOTTOM
    execute as @e[tag=NAN_STOP] at @s run execute unless entity @e[distance=..1,tag=!NAN,limit=1,sort=nearest] run kill @s

# DATA CORRUPTION
    # GRAB
    execute if entity @e[tag=THROW] run execute store result score Health: Data run data get entity @e[tag=GRABBED,limit=1] Health
    execute if entity @e[tag=THROW] run execute store result score Hunger: Data run data get entity @e[tag=GRABBED,limit=1] foodLevel
    execute if entity @e[tag=THROW] run execute store result score Xp: Data run data get entity @e[tag=GRABBED,limit=1] XpLevel
    execute if entity @e[tag=THROW] run execute store result score PosX: Data run data get entity @e[tag=GRABBED,limit=1] Pos[0]
    execute if entity @e[tag=THROW] run execute store result score PosY: Data run data get entity @e[tag=GRABBED,limit=1] Pos[1]
    execute if entity @e[tag=THROW] run execute store result score PosZ: Data run data get entity @e[tag=GRABBED,limit=1] Pos[2]
    execute if entity @e[tag=THROW] run execute store result score SpawnX: Data run data get entity @e[tag=GRABBED,limit=1] SpawnX
    execute if entity @e[tag=THROW] run execute store result score SpawnZ: Data run data get entity @e[tag=GRABBED,limit=1] SpawnZ
    execute if entity @e[tag=THROW] run execute store result score Corruption: Data run scoreboard players get @e[tag=GRABBED,limit=1] Corruption
    # GRAB_REMOVE
    kill @e[tag=THROW,scores={Timer=5..}]
    execute unless entity @e[tag=THROW] run tag @e[tag=GRABBED] remove GRABBED
    execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] levitation
    # CORRUPTION
    attribute @e[limit=1,scores={Corruption=10..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174001 "Corruption1" -0.1 multiply
    attribute @e[limit=1,scores={Corruption=20..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174002 "Corruption2" -0.12 multiply
    attribute @e[limit=1,scores={Corruption=30..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174003 "Corruption3" -0.13 multiply
    attribute @e[limit=1,scores={Corruption=40..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174004 "Corruption4" -0.15 multiply
    attribute @e[limit=1,scores={Corruption=50..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174005 "Corruption5" -0.17 multiply
    attribute @e[limit=1,scores={Corruption=60..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174006 "Corruption6" -0.2 multiply
    attribute @e[limit=1,scores={Corruption=70..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174007 "Corruption7" -0.25 multiply
    attribute @e[limit=1,scores={Corruption=80..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174008 "Corruption8" -0.33 multiply
    attribute @e[limit=1,scores={Corruption=90..}] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174009 "Corruption9" -0.5 multiply
    kill @e[scores={Corruption=100..}]

