execute unless score ClonesExist Timer > Two Timer run scoreboard players add ClonesExist Timer 1
execute if score ClonesExist Timer > Two Timer run kill @e[tag=!CORR,tag=CORR_CLONE]
execute unless entity @e[tag=CORR_CLONE] run tag @e[tag=DISTORTED] remove DISTORTED