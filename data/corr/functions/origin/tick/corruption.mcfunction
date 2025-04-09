# OBJECTS
    # EFFECTS
    execute as @e[scores={Corruption=10..}] run power grant @s corr:for_enemies_corruption_shaking
    # TELEPORT
    scoreboard players add @e[scores={Corruption=10..}] Timer 1
    execute as @e[scores={Timer=3000..,Corruption=10..}] at @s run spreadplayers ~ ~ 0 1 false @s
    execute as @e[scores={Timer=2000..,Corruption=40..}] at @s run spreadplayers ~ ~ 0 1 false @s
    execute as @e[scores={Timer=1000..,Corruption=70..}] at @s run spreadplayers ~ ~ 0 1 false @s
    execute as @e[scores={Timer=500..,Corruption=90..}] at @s run spreadplayers ~ ~ 0 1 false @s
    scoreboard players set @e[scores={Timer=3001..,Corruption=10..}] Timer 0
    scoreboard players set @e[scores={Timer=2001..,Corruption=40..}] Timer 0
    scoreboard players set @e[scores={Timer=1001..,Corruption=70..}] Timer 0
    scoreboard players set @e[scores={Timer=501..,Corruption=90..}] Timer 0
    # DEBUFFS
    attribute @e[limit=1,scores={Corruption=10..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174001 "Corruption1" -0.1 multiply
    attribute @e[limit=1,scores={Corruption=20..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174002 "Corruption2" -0.12 multiply
    attribute @e[limit=1,scores={Corruption=30..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174003 "Corruption3" -0.13 multiply
    attribute @e[limit=1,scores={Corruption=40..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174004 "Corruption4" -0.15 multiply
    attribute @e[limit=1,scores={Corruption=50..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174005 "Corruption5" -0.17 multiply
    attribute @e[limit=1,scores={Corruption=60..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174006 "Corruption6" -0.2 multiply
    attribute @e[limit=1,scores={Corruption=70..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174007 "Corruption7" -0.25 multiply
    attribute @e[limit=1,scores={Corruption=80..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174008 "Corruption8" -0.33 multiply
    attribute @e[limit=1,scores={Corruption=90..},tag=!CORR] minecraft:generic.max_health modifier add 123e4567-e89b-12d3-a456-426614174009 "Corruption9" -0.5 multiply
    # KILL
    kill @e[scores={Corruption=100..}]
# CORR
    # RANDOM TP CORR
    scoreboard players add @a[scores={Corruption=100..},tag=CORR] Timer 1
    scoreboard players set @a[scores={Timer=101..,Corruption=100..},tag=CORR] Timer 0
    scoreboard players set @a[scores={Corruption=100..},tag=CORR,gamemode=spectator] Timer 0
    execute as @a[scores={Timer=100..,Corruption=100..},tag=CORR] at @s run spreadplayers ~ ~ 0 1 false @s
    # CLONES
    execute store result score ClonesCount Timer run execute if entity @e[tag=CORR_CLONE]
    execute at @a[tag=CORR,gamemode=!spectator,scores={Corruption=100}] unless score ClonesCount Timer matches 4.. run summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["NAN","CORR_CLONE"],NoBasePlate:true,ArmorItems:[{id:"chainmail_boots",Count:1},{id:"chainmail_leggings",Count:1},{id:"chainmail_chestplate",Count:1},{id:"chainmail_helmet",Count:1}]}
    execute at @a[tag=CORR] run spreadplayers ~ ~ 1 1 false @e[tag=CORR_CLONE]
    execute as @e[tag=CORR_CLONE] run data modify entity @s Rotation set from entity @a[tag=CORR,limit=1] Rotation
    execute as @e[tag=CORR_CLONE] run data modify entity @s Pos[1] set from entity @a[tag=CORR,limit=1] Pos[1]
    execute if entity @a[tag=CORR,scores={Corruption=100}] run function corr:origin/tick/colorful
    # DELETE CLONES
    execute if entity @a[tag=CORR,scores={Corruption=..99}] run kill @e[tag=CORR_CLONE]
    execute if entity @a[tag=CORR,gamemode=spectator] run kill @e[tag=CORR_CLONE]
    execute if score ClonesCount Timer matches 5.. run kill @e[tag=CORR_CLONE,limit=1]
    # BUFFS
    effect give @a[scores={Corruption=100..},tag=CORR] minecraft:speed 1 3 true
    attribute @a[scores={Corruption=100..},limit=1,tag=CORR] minecraft:generic.attack_speed base set 10
    attribute @a[scores={Corruption=100..},limit=1,tag=CORR] minecraft:generic.attack_damage base set 10
    attribute @a[scores={Corruption=100..},limit=1,tag=CORR] minecraft:generic.attack_knockback base set 10
    attribute @a[scores={Corruption=..99},limit=1,tag=CORR] minecraft:generic.attack_speed base set 4
    attribute @a[scores={Corruption=..99},limit=1,tag=CORR] minecraft:generic.attack_damage base set 1
    attribute @a[scores={Corruption=..99},limit=1,tag=CORR] minecraft:generic.attack_knockback base set 0
    # EFFECTS
    execute as @a[tag=CORR,scores={Corruption=100}] run power grant @s corr:for_enemies_corruption_shaking
    execute as @a[tag=CORR,scores={Corruption=100}] run power grant @s corr:for_enemies_cracking_overlay
    execute as @a[tag=CORR,scores={Corruption=..99}] run power remove @s corr:for_enemies_corruption_shaking
    execute as @a[tag=CORR,scores={Corruption=..99}] run power remove @s corr:for_enemies_cracking_overlay
