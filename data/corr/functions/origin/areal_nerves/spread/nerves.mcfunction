# SETUP
execute store result score NaNTopsCount Timer run execute if entity @e[tag=NAN_TOP]
execute store result score NaNBottomsCount Timer run execute if entity @e[tag=NAN_BOTTOM]
execute at @e[tag=CORR_NERVES] unless score NaNTopsCount Timer matches 3.. run summon minecraft:block_display ~ ~20 ~ {Tags:["NAN_TOP","CORR_NERVES_ENDS","NAN"]}
execute at @e[tag=CORR_NERVES] unless score NaNBottomsCount Timer matches 3.. run summon minecraft:block_display ~ ~-20 ~ {Tags:["NAN_BOTTOM","CORR_NERVES_ENDS","NAN"]}
execute at @e[tag=CORR_NERVES] run spreadplayers ~ ~ 0 20 false @e[tag=CORR_NERVES_ENDS]
execute as @e[tag=CORR_NERVES_ENDS] run data modify entity @s Pos[1] set from entity @e[tag=CORR_NERVES,limit=1] Pos[1]
execute as @e[tag=NAN_TOP,type=block_display] at @s run tp @s ~ ~20 ~
execute as @e[tag=NAN_BOTTOM,type=block_display] at @s run tp @s ~ ~-20 ~
# SCOREBOARDS
execute if score NervesMoving Timer < Two Timer run scoreboard players add NervesMoving Timer 1
execute if entity @a[tag=CORR_NERVES] run scoreboard players set NervesMoving Timer 0
scoreboard players add CameraShake Timer 1
scoreboard players operation CameraShake Timer %= Two Timer
# EFFECTS
execute at @e[tag=NAN_TOP] run summon minecraft:block_display ~ ~-100 ~ {view_range:1000f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,40f]},block_state:{Name:"purple_wool"},NoGravity:1b,Tags:["NAN_DYING","NAN"]}
execute as @e[tag=NAN_DYING,scores={Timer=..1}] at @s run tp @s ~ ~100 ~ facing entity @e[tag=NAN_BOTTOM,limit=1,sort=random] feet
execute if score NervesMoving Timer < Two Timer at @e[tag=CORR_NERVES] run execute as @e[tag=!NAN,distance=..35] run damage @s 2
execute if score NervesMoving Timer < Two Timer run execute if score CameraShake Timer matches 1 at @e[tag=CORR_NERVES] run execute as @a[distance=..150] at @s run tp @s ~ ~ ~ ~1 ~
execute if score NervesMoving Timer < Two Timer run execute if score CameraShake Timer matches 0 at @e[tag=CORR_NERVES] run execute as @a[distance=..150] at @s run tp @s ~ ~ ~ ~-1 ~
# STOPPING
execute at @e[tag=CORR_NERVES] run tag @e[distance=..20,tag=!NAN,nbt={Brain:{}}] add NAN_BOTTOM
execute at @e[tag=CORR_NERVES] run execute at @e[tag=!NAN,distance=..20,nbt={Brain:{}}] run execute unless entity @e[tag=NAN_STOP,distance=..1] run summon minecraft:block_display ~ ~ ~ {Tags:["NAN_STOP","NAN"]}
execute as @e[tag=NAN_STOP,scores={Timer=..1}] at @s run data modify entity @s Rotation set from entity @e[tag=!NAN,distance=..1,limit=1,sort=nearest] Rotation
execute as @e[tag=NAN_STOP,scores={Timer=2..}] at @s run tp @e[tag=!NAN,distance=..1] @s
# DESTRUCTION
execute if score NervesMoving Timer < Two Timer at @e[tag=NAN_DYING,scores={Timer=2}] run summon minecraft:block_display ~ ~ ~ {Tags:["NAN_DESTROYER","NAN"]}
execute as @e[tag=NAN_DYING,scores={Timer=2}] at @s run tp @e[tag=NAN_DESTROYER,distance=..0.1] @s
execute as @e[tag=NAN_DESTROYER] at @s run tp @s ^ ^ ^2
execute as @e[tag=NAN_DESTROYER] at @s run setblock ~ ~ ~ air
# SOUND
execute if score NervesMoving Timer < Two Timer at @e[tag=CORR_NERVES] run playsound minecraft:entity.generic.explode ambient @a[distance=..150] ~ ~ ~ 10 2 1
# REMOVAL
scoreboard players add @e[tag=NAN,type=!player] Timer 1
kill @e[tag=NAN_DYING,scores={Timer=150..}]
kill @e[tag=NAN_DESTROYER,scores={Timer=35..}]
kill @e[tag=REMOVE,limit=30]
execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_STOP,distance=21..,limit=1]
execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_DYING,scores={Timer=5..},distance=35..]
execute at @e[tag=CORR_NERVES] positioned ~ ~5 ~ run tag @e[distance=20..,tag=!NAN] remove NAN_BOTTOM
execute as @e[tag=NAN_STOP] at @s run execute unless entity @e[distance=..1,tag=!NAN,limit=1,sort=nearest] run kill @s
