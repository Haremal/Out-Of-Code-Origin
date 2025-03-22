# CHOOSE_ORIGIN
execute if entity @a[tag=CORR] run origin set @a[tag=!CORR,nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] origins:origin origins:human
execute unless entity @a[tag=CORR] run tag @a[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add CORR
tag @a[tag=CORR] add NAN
# scoreboard players set @a[tag=CORR] Corruption 100
# REMOVE_ORIGIN
tag @a[nbt=!{ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] remove CORR
tag @a[tag=!CORR] remove NAN

# SCOREBOARD ACTIONS
scoreboard players add @e[tag=NAN,type=!player] Timer 1
scoreboard players add CameraShake Timer 1
scoreboard players operation CameraShake Timer %= Two Timer
scoreboard players add NervesMoving Timer 1

# CORR_NERVES
    # SPREAD
    execute store result score NAN_TOPS_COUNT Timer run execute if entity @e[tag=NAN_TOP]
    execute store result score NAN_BOTTOMS_COUNT Timer run execute if entity @e[tag=NAN_BOTTOM]
    execute at @e[tag=CORR_NERVES] unless score NAN_TOPS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~20 ~ {Invisible:true,NoGravity:true,Tags:["NAN_TOP","CORR_NERVES_ENDS","NAN"]}
    execute at @e[tag=CORR_NERVES] unless score NAN_BOTTOMS_COUNT Timer matches 3.. run summon minecraft:armor_stand ~ ~-20 ~ {Invisible:true,NoGravity:true,Tags:["NAN_BOTTOM","CORR_NERVES_ENDS","NAN"]}
        execute at @e[tag=CORR_NERVES] run spreadplayers ~ ~ 15 20 false @e[tag=CORR_NERVES_ENDS]
        execute as @e[tag=CORR_NERVES_ENDS] run data modify entity @s Pos[1] set from entity @e[tag=CORR_NERVES,limit=1] Pos[1]
        execute as @e[tag=NAN_TOP,type=armor_stand] at @s run tp @s ~ ~20 ~
        execute as @e[tag=NAN_BOTTOM,type=armor_stand] at @s run tp @s ~ ~-20 ~
    execute at @e[tag=NAN_TOP] run summon minecraft:block_display ~ ~-100 ~ {view_range:1000f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,40f]},block_state:{Name:"purple_wool"},NoGravity:1b,Tags:["NAN_DYING","NAN"]}
    execute as @e[tag=NAN_DYING,scores={Timer=..1}] at @s run tp @s ~ ~100 ~ facing entity @e[tag=NAN_BOTTOM,limit=1,sort=random] feet
        execute if score NervesMoving Timer < Two Timer at @e[tag=CORR_NERVES] run execute as @e[tag=!NAN,distance=..40] run damage @s 2
        execute if score NervesMoving Timer < Two Timer run execute if score CameraShake Timer matches 1 at @e[tag=CORR_NERVES] run execute as @a[distance=..80] at @s run tp @s ~ ~ ~ ~1 ~
        execute if score NervesMoving Timer < Two Timer run execute if score CameraShake Timer matches 0 at @e[tag=CORR_NERVES] run execute as @a[distance=..80] at @s run tp @s ~ ~ ~ ~-1 ~
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
    # TURN
    execute if entity @a[tag=CORR_NERVES] run scoreboard players set NervesMoving Timer 0
    # TURN_REMOVE

# DATA_CORRUPTION
    # GRAB
    execute as @e[tag=GRABBED] at @a[tag=CORR] unless entity @e[name=grabbed_data] run summon text_display ^-4 ^ ^8 {Tags:["NAN"],see_through:1b,alignment:"left",CustomName:'{"text":"grabbed_data"}',text:'[{"text":"Entity\'s Data:","bold":true,"underlined":true},{"text":"\\n- Inventory: ","bold":true,"underlined":false},{"nbt":"Inventory","entity":"@e[tag=GRABBED,limit=1]","color":"gray","bold":false,"underlined":false},{"text":"\\n- UUID: ","bold":true,"underlined":false},{"nbt":"UUID","entity":"@e[tag=GRABBED,limit=1]","color":"blue","bold":false,"underlined":false},{"text":"\\n- Health: ","bold":true,"underlined":false},{"nbt":"Health","entity":"@e[tag=GRABBED,limit=1]","color":"red","bold":false,"underlined":false},{"text":"\\n- Hunger:  ","underlined":false},{"nbt":"foodLevel","entity":"@e[tag=GRABBED,limit=1]","color":"dark_red","bold":false,"underlined":false},{"text":"\\n- Xp: ","underlined":false},{"nbt":"XpLevel","entity":"@e[tag=GRABBED,limit=1]","color":"green","bold":false,"underlined":false},{"text":"\\n- Position: ","bold":true,"underlined":false},{"nbt":"Pos","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Rotation: ","bold":true,"underlined":false},{"nbt":"Rotation","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Spawn: ","bold":true,"underlined":false},{"nbt":"SpawnX ","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"nbt":"SpawnY","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"nbt":"SpawnZ","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Corruption: ","bold":true,"underlined":false},{"score":{"name":"@e[tag=GRABBED,limit=1]","objective":"Corruption"},"color":"light_purple","bold":true,"underlined":false}]'}
    execute at @a[tag=CORR] run tp @e[name=grabbed_data,type=text_display] ^-4 ^ ^8 facing entity @a[tag=CORR,limit=1] eyes
    execute if entity @e[tag=THROW] run execute store result score HealthData Timer run data get entity @e[tag=GRABBED,limit=1] Health
    execute if entity @e[tag=THROW] run data merge entity @e[name=grabbed_data,type=text_display,limit=1] {text:'[{"text":"Entity\'s Data:","bold":true,"underlined":true},{"text":"\\n- Inventory: ","bold":true,"underlined":false},{"nbt":"Inventory","entity":"@e[tag=GRABBED,limit=1]","color":"gray","bold":false,"underlined":false},{"text":"\\n- UUID: ","bold":true,"underlined":false},{"nbt":"UUID","entity":"@e[tag=GRABBED,limit=1]","color":"blue","bold":false,"underlined":false},{"text":"\\n- Health: ","bold":true,"underlined":false},{"nbt":"Health","entity":"@e[tag=GRABBED,limit=1]","color":"red","bold":false,"underlined":false},{"text":"\\n- Hunger:  ","underlined":false},{"nbt":"foodLevel","entity":"@e[tag=GRABBED,limit=1]","color":"dark_red","bold":false,"underlined":false},{"text":"\\n- Xp: ","underlined":false},{"nbt":"XpLevel","entity":"@e[tag=GRABBED,limit=1]","color":"green","bold":false,"underlined":false},{"text":"\\n- Position: ","bold":true,"underlined":false},{"nbt":"Pos","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Rotation: ","bold":true,"underlined":false},{"nbt":"Rotation","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Spawn: ","bold":true,"underlined":false},{"nbt":"SpawnX ","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"nbt":"SpawnY","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"nbt":"SpawnZ","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Corruption: ","bold":true,"underlined":false},{"score":{"name":"@e[tag=GRABBED,limit=1]","objective":"Corruption"},"color":"light_purple","bold":true,"underlined":false}]'}
    # GRAB_REMOVE
    kill @e[tag=THROW,scores={Timer=5..}]
    execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] levitation
    execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] glowing
    execute unless entity @e[tag=THROW] run tag @e[tag=GRABBED] remove GRABBED
    execute unless entity @e[tag=THROW] run kill @e[name=grabbed_data,type=text_display]
    # CORRUPTION
    scoreboard players add @e[scores={Corruption=10..}] Timer 1
    execute as @e[scores={Timer=10000..,Corruption=10..}] at @s run spreadplayers ~ ~ 0 1 false @s
    scoreboard players set @e[scores={Timer=10001..,Corruption=10..}] Timer 0
    execute as @e[scores={Timer=5000..,Corruption=40..}] at @s run spreadplayers ~ ~ 0 2 false @s
    scoreboard players set @e[scores={Timer=5001..,Corruption=40..}] Timer 0
    execute as @e[scores={Timer=3000..,Corruption=70..}] at @s run spreadplayers ~ ~ 0 5 false @s
    scoreboard players set @e[scores={Timer=3001..,Corruption=70..}] Timer 0
    execute as @e[scores={Timer=1000..,Corruption=90..}] at @s run spreadplayers ~ ~ 0 7 false @s
    scoreboard players set @e[scores={Timer=1001..,Corruption=90..}] Timer 0
    execute as @e[scores={Timer=500..,Corruption=100..}] at @s run spreadplayers ~ ~ 0 1 false @s
    scoreboard players set @e[scores={Timer=1001..,Corruption=90..}] Timer 0
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
    # CORRUPTION_REMOVE

# OUT_OF_CODE
    # RELOCATE
    # RELOCATE_REMOVE
    # GLITCH
    # GLITCH_REMOVE
