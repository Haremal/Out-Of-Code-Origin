# VISUAL
summon minecraft:block_display ~ ~ ~ {view_range:1000f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,10f]},Tags:["NAN","CUT"]}
summon minecraft:block_display ^ ^1.5 ^10 {Tags:["NAN","LOOK"]}
execute if predicate corr:true-false run tp @e[tag=CUT] ^-4 ^2.5 ^10 facing entity @e[tag=LOOK,limit=1]
execute unless predicate corr:true-false run tp @e[tag=CUT] ^4.5 ^2 ^10 facing entity @e[tag=LOOK,limit=1]
kill @e[tag=LOOK]
# SOUND
playsound minecraft:entity.generic.explode ambient @a[distance=..150] ~ ~ ~ 10 2 1
# DESTRUCTION
execute at @e[tag=CUT] run summon minecraft:block_display ~ ~ ~ {Tags:["NAN","CUT_DESTROY"]}
execute as @e[tag=CUT_DESTROY] run data modify entity @s Rotation set from entity @e[tag=CUT,limit=1,sort=nearest] Rotation
