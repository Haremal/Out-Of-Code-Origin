# SELF
tag @a[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add CORR
tag @a[tag=CORR] add NAN
tag @a[tag=CORR] add CORRUPTION
scoreboard players add @e[tag=NAN,type=!player] Timer 1

# NAN NERVES
    # SPREAD
    execute at @e[tag=CORR_NERVES] unless score NAN_TOPS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~20 ~ {Invisible:true,NoGravity:true,Tags:["NAN_TOP","CORR_NERVES_ENDS","NAN"]}
    execute at @e[tag=CORR_NERVES] unless score NAN_BOTTOMS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~-20 ~ {Invisible:true,NoGravity:true,Tags:["NAN_BOTTOM","CORR_NERVES_ENDS","NAN"]}
    execute store result score NAN_TOPS_COUNT Timer run execute if entity @e[tag=NAN_TOP]
    execute store result score NAN_BOTTOMS_COUNT Timer run execute if entity @e[tag=NAN_BOTTOM]
    execute at @e[tag=NAN_TOP] run summon minecraft:block_display ~ ~-100 ~ {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,40f]},block_state:{Name:"purple_wool"},NoGravity:1b,Tags:["NAN_DYING","NAN"]}
    # SPREAD_CONFIG
    execute at @e[tag=CORR_NERVES] run spreadplayers ~ ~ 15 20 false @e[tag=CORR_NERVES_ENDS]
    execute as @e[tag=CORR_NERVES_ENDS] run data modify entity @s Pos[1] set from entity @e[tag=CORR_NERVES,limit=1] Pos[1]
    execute as @e[tag=NAN_TOP,type=armor_stand] at @s run tp @s ~ ~20 ~
    execute as @e[tag=NAN_BOTTOM,type=armor_stand] at @s run tp @s ~ ~-20 ~
    execute as @e[tag=NAN_DYING,scores={Timer=..1}] at @s run tp @s ~ ~100 ~ facing entity @e[tag=NAN_BOTTOM,limit=1,sort=random] feet
    # SPREAD_AREA
    execute at @e[tag=CORR_NERVES] positioned ~ ~5 ~ run tag @e[distance=..20,tag=!NAN] add NAN_BOTTOM
    execute at @e[tag=CORR_NERVES] positioned ~ ~5 ~ run execute at @e[tag=!NAN,distance=..20] run execute unless entity @e[tag=NAN_STOP,distance=..1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,Tags:["NAN_STOP","NAN"]}
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
    tag @e[tag=GRABBED] add CORRUPTION
    execute if entity @e[tag=THROW] run execute store result score Health: Data run data get entity @e[tag=GRABBED,limit=1] Health
    execute if entity @e[tag=THROW] run execute store result score Hunger: Data run data get entity @e[tag=GRABBED,limit=1] foodLevel
    execute if entity @e[tag=THROW] run execute store result score Xp: Data run data get entity @e[tag=GRABBED,limit=1] XpLevel
    execute if entity @e[tag=THROW] run execute store result score PosX: Data run data get entity @e[tag=GRABBED,limit=1] Pos[0]
    execute if entity @e[tag=THROW] run execute store result score PosY: Data run data get entity @e[tag=GRABBED,limit=1] Pos[1]
    execute if entity @e[tag=THROW] run execute store result score PosZ: Data run data get entity @e[tag=GRABBED,limit=1] Pos[2]
    execute if entity @e[tag=THROW] run execute store result score SpawnX: Data run data get entity @e[tag=GRABBED,limit=1] SpawnX
    execute if entity @e[tag=THROW] run execute store result score SpawnZ: Data run data get entity @e[tag=GRABBED,limit=1] SpawnZ
    # GRAB_REMOVE
    kill @e[tag=THROW,scores={Timer=5..}]
    execute unless entity @e[tag=THROW] run tag @e[tag=GRABBED] remove GRABBED
    execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] levitation
    # CORRUPTION
    execute as @a[tag=CORRUPTION] if data entity @s {Health:0.0f} run tag @s remove CORRUPTION
    # CORRUPTED_REMOVE
    execute as @a[tag=CORRUPTION] if data entity @s {Health:0.0f} run tag @s remove CORRUPTION

