    # CHOOSE_ORIGIN
execute if entity @a[tag=CORR] run origin set @a[tag=!CORR,nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] origins:origin origins:human
execute unless entity @a[tag=CORR] run tag @a[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add CORR
tag @a[tag=CORR] add NAN
# scoreboard players set @a[tag=CORR] Corruption 100
item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet
item replace entity @a[tag=CORR] armor.chest with minecraft:chainmail_chestplate
item replace entity @a[tag=CORR] armor.legs with minecraft:chainmail_leggings
item replace entity @a[tag=CORR] armor.feet with minecraft:chainmail_boots
# REMOVE_ORIGIN
tag @a[nbt=!{ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] remove CORR
tag @a[tag=!CORR] remove NAN

# SCOREBOARD ACTIONS
scoreboard players add @e[tag=NAN,type=!player] Timer 1
scoreboard players add CameraShake Timer 1
scoreboard players operation CameraShake Timer %= Two Timer
scoreboard players add NervesMoving Timer 1
scoreboard players add NaNBiome Timer 1
scoreboard players add ClonesExist Timer 1
execute if score NaNBiome Timer matches 6.. run scoreboard players set NaNBiome Timer 0

# CORR_NERVES
    # SPREAD
    execute store result score NaNTopsCount Timer run execute if entity @e[tag=NAN_TOP]
    execute store result score NaNBottomsCount Timer run execute if entity @e[tag=NAN_BOTTOM]
    execute at @e[tag=CORR_NERVES] unless score NaNTopsCount Timer matches 3.. run summon minecraft:block_display ~ ~20 ~ {Tags:["NAN_TOP","CORR_NERVES_ENDS","NAN"]}
    execute at @e[tag=CORR_NERVES] unless score NaNBottomsCount Timer matches 3.. run summon minecraft:block_display ~ ~-20 ~ {Tags:["NAN_BOTTOM","CORR_NERVES_ENDS","NAN"]}
        execute at @e[tag=CORR_NERVES] run spreadplayers ~ ~ 0 20 false @e[tag=CORR_NERVES_ENDS]
        execute as @e[tag=CORR_NERVES_ENDS] run data modify entity @s Pos[1] set from entity @e[tag=CORR_NERVES,limit=1] Pos[1]
        execute as @e[tag=NAN_TOP,type=block_display] at @s run tp @s ~ ~20 ~
        execute as @e[tag=NAN_BOTTOM,type=block_display] at @s run tp @s ~ ~-20 ~
    execute at @e[tag=NAN_TOP] run summon minecraft:block_display ~ ~-100 ~ {view_range:1000f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,40f]},block_state:{Name:"purple_wool"},NoGravity:1b,Tags:["NAN_DYING","NAN"]}
    execute as @e[tag=NAN_DYING,scores={Timer=..1}] at @s run tp @s ~ ~100 ~ facing entity @e[tag=NAN_BOTTOM,limit=1,sort=random] feet
        execute if score NervesMoving Timer < Two Timer at @e[tag=CORR_NERVES] run execute as @e[tag=!NAN,distance=..35] run damage @s 2
        execute if score NervesMoving Timer < Two Timer run execute if score CameraShake Timer matches 1 at @e[tag=CORR_NERVES] run execute as @a[distance=..150] at @s run tp @s ~ ~ ~ ~1 ~
        execute if score NervesMoving Timer < Two Timer run execute if score CameraShake Timer matches 0 at @e[tag=CORR_NERVES] run execute as @a[distance=..150] at @s run tp @s ~ ~ ~ ~-1 ~
    execute at @e[tag=CORR_NERVES] run tag @e[distance=..20,tag=!NAN,nbt={Brain:{}}] add NAN_BOTTOM
    execute at @e[tag=CORR_NERVES] run execute at @e[tag=!NAN,distance=..20,nbt={Brain:{}}] run execute unless entity @e[tag=NAN_STOP,distance=..1] run summon minecraft:block_display ~ ~ ~ {Tags:["NAN_STOP","NAN"]}
    execute as @e[tag=NAN_STOP,scores={Timer=..1}] at @s run data modify entity @s Rotation set from entity @e[tag=!NAN,distance=..1,limit=1,sort=nearest] Rotation
    execute as @e[tag=NAN_STOP,scores={Timer=2..}] at @s run tp @e[tag=!NAN,distance=..1] @s
        execute if score NervesMoving Timer < Two Timer at @e[tag=NAN_DYING,scores={Timer=2}] run summon minecraft:block_display ~ ~ ~ {Tags:["NAN_DESTROYER","NAN"]}
        execute as @e[tag=NAN_DYING,scores={Timer=2}] at @s run tp @e[tag=NAN_DESTROYER,distance=..0.1] @s
        execute as @e[tag=NAN_DESTROYER] at @s run tp @s ^ ^ ^2
        execute as @e[tag=NAN_DESTROYER] at @s run setblock ~ ~ ~ air
    execute if score NervesMoving Timer < Two Timer at @e[tag=CORR_NERVES] run playsound minecraft:entity.generic.explode ambient @a[distance=..150] ~ ~ ~ 10 2 1
    # SPREAD_REMOVE
    kill @e[tag=NAN_DYING,scores={Timer=150..}]
    kill @e[tag=NAN_DESTROYER,scores={Timer=35..}]
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
    execute store result score grabPosX Position run data get entity @e[tag=GRABBED,limit=1] Pos[0]
    execute store result score grabPosY Position run data get entity @e[tag=GRABBED,limit=1] Pos[1]
    execute store result score grabPosZ Position run data get entity @e[tag=GRABBED,limit=1] Pos[2]
    execute as @e[tag=GRABBED] at @a[tag=CORR] unless entity @e[name=grabbed_data] run summon text_display ^-4 ^ ^8 {Tags:["NAN"],alignment:"left",CustomName:'{"text":"grabbed_data"}'}
    execute if entity @e[tag=THROW] run data merge entity @e[name=grabbed_data,type=text_display,limit=1] {text:'[{"text":"Entity\'s Data:","bold":true,"underlined":true},{"text":"\\n- Inventory: ","bold":true,"underlined":false},{"nbt":"Inventory","entity":"@e[tag=GRABBED,limit=1]","color":"gray","bold":false,"underlined":false},{"text":"\\n- UUID: ","bold":true,"underlined":false},{"nbt":"UUID","entity":"@e[tag=GRABBED,limit=1]","color":"blue","bold":false,"underlined":false},{"text":"\\n- Health: ","bold":true,"underlined":false},{"nbt":"Health","entity":"@e[tag=GRABBED,limit=1]","color":"red","bold":false,"underlined":false},{"text":"\\n- Hunger:  ","underlined":false},{"nbt":"foodLevel","entity":"@e[tag=GRABBED,limit=1]","color":"dark_red","bold":false,"underlined":false},{"text":"\\n- Xp: ","underlined":false},{"nbt":"XpLevel","entity":"@e[tag=GRABBED,limit=1]","color":"green","bold":false,"underlined":false},{"text":"\\n- Position: ","bold":true,"underlined":false},{"score":{"name":"grabPosX","objective":"Position"},"color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"score":{"name":"grabPosY","objective":"Position"},"color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"score":{"name":"grabPosZ","objective":"Position"},"color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Rotation: ","bold":true,"underlined":false},{"nbt":"Rotation","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Spawn: ","bold":true,"underlined":false},{"nbt":"SpawnX ","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"nbt":"SpawnY","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":", ","color":"aqua","bold":false,"underlined":false},{"nbt":"SpawnZ","entity":"@e[tag=GRABBED,limit=1]","color":"aqua","bold":false,"underlined":false},{"text":"\\n- Corruption: ","bold":true,"underlined":false},{"score":{"name":"@e[tag=GRABBED,limit=1]","objective":"Corruption"},"color":"light_purple","bold":true,"underlined":false}]'}
    execute at @a[tag=CORR] run tp @e[name=grabbed_data,type=text_display] ^-4 ^ ^8 facing entity @a[tag=CORR,limit=1] eyes
    execute if entity @e[tag=THROW] run execute store result score HealthData Timer run data get entity @e[tag=GRABBED,limit=1] Health
    execute at @e[tag=GRABBED] run setblock ~ ~ ~ air destroy
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
    # DISTORT
    execute store result score ClonesCount Timer run execute if entity @e[tag=CORR_CLONE]
    # DISTORT_REMOVE
    execute if score ClonesExist Timer > Two Timer run kill @e[tag=!CORR,tag=CORR_CLONE]
    # GLITCH
    execute store result score corrPosX Position run data get entity @a[tag=CORR,limit=1] Pos[0]
    execute store result score corrPosY Position run data get entity @a[tag=CORR,limit=1] Pos[1]
    execute store result score corrPosZ Position run data get entity @a[tag=CORR,limit=1] Pos[2]
    scoreboard players operation corrDim Position = corrPosX Position
    scoreboard players operation corrDim Position %= corrPosZ Position
    scoreboard players operation corrDim Position %= Three Timer
    execute as @a[tag=CORR,nbt={Dimension:"corr:out_of_code_dimension"}] run title @s actionbar ["Universe: ",{"color":"light_purple","score":{"name":"corrDim","objective":"Position"}}," X: ",{"color":"light_purple","score":{"name":"corrPosX","objective":"Position"}}," Y: ",{"color":"light_purple","score":{"name":"corrPosY","objective":"Position"}}," Z: ",{"color":"light_purple","score":{"name":"corrPosZ","objective":"Position"}}]
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_1
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_2
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_3
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_4
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_5
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_6
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_7
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_8
        execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_9
        execute if score NaNBiome Timer matches 0 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_2
        execute if score NaNBiome Timer matches 1 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_3
        execute if score NaNBiome Timer matches 2 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_1
        execute if score NaNBiome Timer matches 3 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_4
        execute if score NaNBiome Timer matches 4 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_7
        execute if score NaNBiome Timer matches 5 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_9
    item replace entity @a[tag=CORR,nbt={Dimension:"corr:out_of_code_dimension"}] armor.head with minecraft:chainmail_helmet
    stopsound @a[nbt={Dimension:"corr:out_of_code_dimension"}] * minecraft:item.armor.equip_chainmail

    # GLITCH_REMOVE
