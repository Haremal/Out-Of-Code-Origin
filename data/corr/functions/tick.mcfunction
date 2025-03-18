# TAGS
tag @e[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add NAN
tag @e[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add CORRUPTED

# SCOREBOARDS
scoreboard players set @e[tag=NAN_NERVES] Timer 1
scoreboard players add @e[tag=DYING] Timer 1
scoreboard players add @e[tag=STOP] Timer 1

# NAN NERVES
    # APPEARANCE
        # STORE
        execute store result score STARTS_COUNT Timer run execute if entity @e[name="nerve_start"]
        execute store result score ENDS_COUNT Timer run execute if entity @e[name="nerve_end"]
        # CREATION
        execute at @e[tag=NAN_NERVES] unless score STARTS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,CustomName:'{"text":"nerve_start"}',Tags:["NAN_NERVES_ENDS","NAN"]}
        execute at @e[tag=NAN_NERVES] unless score ENDS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,CustomName:'{"text":"nerve_end"}',Tags:["NAN_NERVES_ENDS","NAN"]}
        execute at @e[name=nerve_start] run summon minecraft:block_display ~ ~-100 ~ {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,70f]},block_state:{Name:"purple_wool"},NoGravity:1b,CustomName:'{"text":"nerve"}',Tags:["DYING","NAN"]}
        # TELEPORT
        execute at @e[tag=NAN_NERVES] run spreadplayers ~ ~ 15 20 false @e[tag=NAN_NERVES_ENDS]
        execute as @e[name=nerve_start] at @s run tp @s ~ ~25 ~
        execute as @e[name=nerve_end] at @s run tp @s ~ ~-10 ~
        execute as @e[name=nerve,scores={Timer=..1}] at @s run tp @s ~ ~100 ~ facing entity @e[name="nerve_end",limit=1,sort=random] eyes
        # REMOVAl
        kill @e[tag=DYING,scores={Timer=100..}]
        execute unless entity @e[tag=NAN_NERVES] run kill @e[tag=DYING,limit=30]
        execute unless entity @e[tag=NAN_NERVES] run kill @e[tag=NAN_NERVES_ENDS]
    # POWERS

        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OPTIMILIZE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! (it sucks)
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        # EXECUTE
        execute at @e[tag=NAN_NERVES] positioned ~ ~5 ~ run tag @e[distance=..20,tag=!NAN] add CORRUPTED
        execute at @e[tag=NAN_NERVES] positioned ~ ~5 ~ run execute at @e[tag=!NAN,distance=..20] run execute unless entity @e[tag=STOP,distance=..0.3] run summon minecraft:armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,Tags:["STOP","NAN"]}
        # REMOVAl
        execute at @e[tag=NAN_NERVES] positioned ~ ~5 ~ run kill @e[tag=STOP,distance=21..,limit=1]
        execute unless entity @e[tag=NAN_NERVES] run kill @e[tag=STOP,limit=1]
        execute as @e[tag=STOP] at @s run execute unless entity @e[distance=..0.1,tag=!NAN,limit=1,sort=nearest] run kill @s
        # TELEPORT
        execute as @e[tag=STOP,scores={Timer=..1}] at @s run tp @s @e[tag=!NAN,distance=..1,limit=1,sort=nearest]
        execute as @e[tag=STOP,scores={Timer=2..}] at @s run tp @e[tag=!NAN,distance=..0.1] @s


# CORRUPTED
    execute at @e[tag=CORRUPTED] run

