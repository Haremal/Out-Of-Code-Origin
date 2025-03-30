# VISUAL
summon minecraft:block_display ~ ~ ~ {view_range:1000f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,10f]},Tags:["NAN","CUT","WOOL"]}
summon minecraft:block_display ^ ^1.5 ^10 {Tags:["NAN","LOOK"]}
execute if predicate corr:true-false run tp @e[tag=CUT] ^-4 ^2.5 ^10 facing entity @e[tag=LOOK,limit=1]
execute unless predicate corr:true-false run tp @e[tag=CUT] ^4.5 ^2 ^10 facing entity @e[tag=LOOK,limit=1]
kill @e[tag=LOOK]
# SOUND
playsound minecraft:entity.generic.explode ambient @a[distance=..150] ~ ~ ~ 10 2 1
# DESTRUCTION
summon minecraft:block_display ^ ^1.5 ^10 {Tags:["NAN","CUT_DESTROY"]}
execute if predicate corr:true-false run summon minecraft:block_display ^4 ^0.5 ^10 {Tags:["NAN","CUT_DESTROY"]}
execute if predicate corr:true-false run summon minecraft:block_display ^-4 ^2.5 ^10 {Tags:["NAN","CUT_DESTROY"]}
execute unless predicate corr:true-false run summon minecraft:block_display ^-4 ^0.5 ^10 {Tags:["NAN","CUT_DESTROY"]}
execute unless predicate corr:true-false run summon minecraft:block_display ^4.5 ^2 ^10 {Tags:["NAN","CUT_DESTROY"]}
execute as @e[tag=CUT_DESTROY] at @s run tp @s ~ ~ ~ facing entity @e[tag=CORR,limit=1]
