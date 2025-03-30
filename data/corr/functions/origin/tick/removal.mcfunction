# NERVES
scoreboard players add @e[tag=NAN,type=!player] Timer 1
kill @e[tag=NAN_DYING,scores={Timer=150..}]
kill @e[tag=REMOVE,limit=30]
execute unless entity @e[tag=CORR_NERVES] run kill @e[tag=NAN_DYING,tag=!REMOVE]
# GRAB
kill @e[tag=THROW,scores={Timer=5..}]
execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] levitation
execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] glowing
execute unless entity @e[tag=THROW] run tag @e[tag=GRABBED] remove GRABBED
execute unless entity @e[tag=THROW] run kill @e[name=grabbed_data,type=text_display]

# DISTORT
execute unless score ClonesExist Timer matches 3.. run scoreboard players add ClonesExist Timer 1
execute if score ClonesExist Timer matches 3.. run kill @e[tag=!CORR,tag=CORR_CLONE]
execute unless entity @e[tag=CORR_CLONE] run tag @e[tag=DISTORTED] remove DISTORTED

# CUT
kill @e[tag=CUT,scores={Timer=10..}]
kill @e[tag=CUT_DESTROY,scores={Timer=10..}]
kill @e[tag=RAVAGE,scores={Timer=5..}]