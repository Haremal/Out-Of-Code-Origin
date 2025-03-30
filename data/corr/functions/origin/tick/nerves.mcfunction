# NERVES
    # SETUP
    execute store result score NaNTopsCount Timer run execute if entity @e[tag=NAN_TOP]
    execute store result score NaNBottomsCount Timer run execute if entity @e[tag=NAN_BOTTOM]
    execute at @e[tag=CORR_NERVES] unless score NaNTopsCount Timer matches 3.. run summon minecraft:block_display ~ ~20 ~ {Tags:["NAN_TOP","CORR_NERVES_ENDS","NAN"]}
    execute at @e[tag=CORR_NERVES] unless score NaNBottomsCount Timer matches 3.. run summon minecraft:block_display ~ ~-20 ~ {Tags:["NAN_BOTTOM","CORR_NERVES_ENDS","NAN"]}
    # TELEPORT ENDS
    execute at @e[tag=CORR_NERVES] run spreadplayers ~ ~ 0 20 false @e[tag=CORR_NERVES_ENDS]
    execute as @e[tag=CORR_NERVES_ENDS] run data modify entity @s Pos[1] set from entity @e[tag=CORR_NERVES,limit=1] Pos[1]
    execute as @e[tag=NAN_TOP,type=block_display] at @s run tp @s ~ ~20 ~
    execute as @e[tag=NAN_BOTTOM,type=block_display] at @s run tp @s ~ ~-20 ~
    # SCOREBOARDS
    execute if score NervesMoving Timer matches ..1 run scoreboard players add NervesMoving Timer 1
    execute if entity @a[tag=CORR_NERVES] run scoreboard players set NervesMoving Timer 0
    # EFFECTS AREA
    execute at @e[tag=NAN_TOP] run summon minecraft:block_display ~ ~ ~ {view_range:1000f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,40f]},Tags:["NAN_DYING","NAN","WOOL"]}
    execute as @e[tag=WOOL,scores={Timer=1..}] run data merge entity @s {block_state:{Name:"purple_wool"}}
    execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_DYING,scores={Timer=5..},distance=35..]
    kill @e[tag=NAN_DYING,scores={Timer=150..}]
    # EFFECTS CAMERA SHAKE
    execute if score NervesMoving Timer matches ..1 run execute if predicate corr:true-false at @e[tag=CORR_NERVES] run execute as @a[distance=..150] at @s run tp @s ~ ~ ~ ~1 ~
    execute if score NervesMoving Timer matches ..1 run execute unless predicate corr:true-false at @e[tag=CORR_NERVES] run execute as @a[distance=..150] at @s run tp @s ~ ~ ~ ~-1 ~
    # EFFECTS ENTITY
    execute as @e[tag=NAN_DYING,scores={Timer=..1}] at @s run tp @s ~ ~ ~ facing entity @e[tag=NAN_BOTTOM,limit=1,sort=random] feet
    execute at @e[tag=CORR_NERVES] run tag @e[distance=..20,tag=!NAN,nbt={Brain:{}}] add NAN_BOTTOM
    execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run tag @e[distance=21..,tag=!NAN] remove NAN_BOTTOM
    # STOPPING
    execute at @e[tag=CORR_NERVES] run execute at @e[tag=!NAN,distance=..20,nbt={Brain:{}}] run execute unless entity @e[tag=NAN_STOP,distance=..1] run summon minecraft:block_display ~ ~ ~ {Tags:["NAN_STOP","NAN"]}
    execute as @e[tag=NAN_STOP,scores={Timer=..1}] at @s run data modify entity @s Rotation set from entity @e[tag=!NAN,distance=..1,limit=1,sort=nearest] Rotation
    execute as @e[tag=NAN_STOP,scores={Timer=2..}] at @s run tp @e[tag=!NAN,distance=..1] @s
    execute as @e[tag=NAN_STOP] at @s run execute unless entity @e[distance=..1,tag=!NAN,limit=1,sort=nearest] run kill @s
    execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_STOP,distance=21..,limit=1]
    # DESTRUCTION
    execute if score NervesMoving Timer matches ..1 at @e[tag=CORR_NERVES] run execute as @e[tag=!NAN,distance=..35] run damage @s 2
    execute if score NervesMoving Timer matches ..1 at @e[tag=NAN_DYING,scores={Timer=2}] run summon minecraft:block_display ~ ~ ~ {Tags:["NAN_DESTROYER","NAN"]}
    execute as @e[tag=NAN_DYING,scores={Timer=2}] at @s run tp @e[tag=NAN_DESTROYER,distance=..0.1] @s
    execute as @e[tag=NAN_DESTROYER] at @s run tp @s ^ ^ ^2
    execute as @e[tag=NAN_DESTROYER] at @s run setblock ~ ~ ~ air
    kill @e[tag=NAN_DESTROYER,scores={Timer=35..}]
    # SOUND
    execute if score NervesMoving Timer matches ..1 at @e[tag=CORR_NERVES] run playsound minecraft:entity.generic.explode ambient @a[distance=..150] ~ ~ ~ 10 2 1

# CUT
execute as @e[tag=CUT_DESTROY] at @s run tp @s ^ ^ ^1
execute as @e[tag=CUT_DESTROY] at @s run setblock ~ ~ ~ air destroy
execute at @e[tag=CUT_DESTROY] run execute as @e[distance=..2,tag=!NAN,nbt={Brain:{}}] run damage @s 16
