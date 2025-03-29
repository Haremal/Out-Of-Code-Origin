data modify entity @e[tag=CORR_NERVES,limit=1] Rotation set from entity @s Rotation
execute as @e[tag=CORR_NERVES,type=!player] at @s run tp @s ^ ^ ^2
scoreboard players set NervesMoving Timer 0