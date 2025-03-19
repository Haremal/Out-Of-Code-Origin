# SELF
tag @e[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add NAN
tag @e[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add CORRUPTED

# NAN NERVES
    # SETUP
    scoreboard players add @e[tag=NAN] Timer 1
    # CREATION
    execute at @e[tag=NAN_NERVES] unless score NAN_TOPS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~20 ~ {Invisible:true,NoGravity:true,Tags:["NAN_TOP","NAN_NERVES_ENDS","NAN"]}
    execute at @e[tag=NAN_NERVES] unless score NAN_BOTTOMS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~-20 ~ {Invisible:true,NoGravity:true,Tags:["NAN_BOTTOM","NAN_NERVES_ENDS","NAN"]}
    execute store result score NAN_TOPS_COUNT Timer run execute if entity @e[tag=NAN_TOP]
    execute store result score NAN_BOTTOMS_COUNT Timer run execute if entity @e[tag=NAN_BOTTOM]
    execute at @e[tag=NAN_TOP] run summon minecraft:block_display ~ ~-100 ~ {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,40f]},block_state:{Name:"purple_wool"},NoGravity:1b,Tags:["NAN_DYING","NAN"]}
    # CONFIG
    execute at @e[tag=NAN_NERVES] run spreadplayers ~ ~ 15 20 false @e[tag=NAN_NERVES_ENDS]
    execute as @e[tag=NAN_NERVES_ENDS] run data modify entity @s Pos[1] set from entity @e[tag=NAN_NERVES,limit=1] Pos[1]
    execute as @e[tag=NAN_TOP,type=armor_stand] at @s run tp @s ~ ~20 ~
    execute as @e[tag=NAN_BOTTOM,type=armor_stand] at @s run tp @s ~ ~-20 ~
    execute as @e[tag=NAN_DYING,scores={Timer=..1}] at @s run tp @s ~ ~100 ~ facing entity @e[tag=NAN_BOTTOM,limit=1,sort=random] feet
    # SPREAD
    execute at @e[tag=NAN_NERVES] positioned ~ ~5 ~ run tag @e[distance=..20,tag=!NAN] add CORRUPTED
    execute at @e[tag=NAN_NERVES] positioned ~ ~5 ~ run tag @e[distance=..20,tag=!NAN] add NAN_BOTTOM
    execute at @e[tag=NAN_NERVES] positioned ~ ~5 ~ run execute at @e[tag=!NAN,distance=..20] run execute unless entity @e[tag=NAN_STOP,distance=..1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,Tags:["NAN_STOP","NAN"]}
    execute as @e[tag=NAN_STOP,scores={Timer=..1}] at @s run data modify entity @s Rotation set from entity @e[tag=!NAN,distance=..1,limit=1,sort=nearest] Rotation
    execute as @e[tag=NAN_STOP,scores={Timer=2..}] at @s run tp @e[tag=!NAN,distance=..1] @s
    # REMOVAl
    kill @e[tag=NAN_DYING,scores={Timer=150..}]
    execute unless entity @e[tag=NAN_NERVES] run kill @e[tag=NAN,type=!player,limit=30]
    execute unless entity @e[tag=NAN_NERVES] run tag @e[tag=NAN_BOTTOM,tag=!NAN] remove NAN_BOTTOM
    execute at @e[tag=NAN_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_STOP,distance=21..,limit=1]
    execute at @e[tag=NAN_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_DYING,scores={Timer=5..},distance=35..]
    execute as @e[tag=NAN_STOP] at @s run execute unless entity @e[distance=..1,tag=!NAN,limit=1,sort=nearest] run kill @s
    execute at @e[tag=NAN_NERVES] positioned ~ ~5 ~ run tag @e[distance=20..,tag=!NAN] remove NAN_BOTTOM

# CORRUPTED
    # REMOVAl
    execute as @a[tag=CORRUPTED] if data entity @s {Health:0.0f} run tag @s remove CORRUPTED



# TOADD

