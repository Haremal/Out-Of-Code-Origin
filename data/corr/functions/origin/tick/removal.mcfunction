# NERVES
scoreboard players add @e[tag=NAN,type=!player] Timer 1
kill @e[tag=NAN_DYING,scores={Timer=150..}]
kill @e[tag=NAN_DESTROYER,scores={Timer=35..}]
kill @e[tag=REMOVE,limit=30]
execute unless entity @e[tag=CORR_NERVES] run kill @e[tag=NAN_DYING,tag=!REMOVE]
execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_STOP,distance=21..,limit=1]
execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run kill @e[tag=NAN_DYING,scores={Timer=5..},distance=35..]
execute at @e[tag=CORR_NERVES] positioned ~ ~ ~ run tag @e[distance=20..,tag=!NAN] remove NAN_BOTTOM
execute as @e[tag=NAN_STOP] at @s run execute unless entity @e[distance=..1,tag=!NAN,limit=1,sort=nearest] run kill @s

# GRAB
kill @e[tag=THROW,scores={Timer=5..}]
execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] levitation
execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] glowing
execute unless entity @e[tag=THROW] run tag @e[tag=GRABBED] remove GRABBED
execute unless entity @e[tag=THROW] run kill @e[name=grabbed_data,type=text_display]

# DISTORT
execute unless score ClonesExist Timer > Two Timer run scoreboard players add ClonesExist Timer 1
execute if score ClonesExist Timer > Two Timer run kill @e[tag=!CORR,tag=CORR_CLONE]
execute unless entity @e[tag=CORR_CLONE] run tag @e[tag=DISTORTED] remove DISTORTED

# CUT
kill @e[tag=CUT,scores={Timer=10..}]
kill @e[tag=CUT_DESTROY,scores={Timer=10..}]
kill @e[tag=RAVAGE,scores={Timer=5..}]