scoreboard players set NervesMoving Timer 0
data modify entity @e[tag=CORR_NERVES,limit=1] Rotation set from entity @s Rotation
execute as @e[tag=CORR_NERVES,type=!player] at @s run tp @s ^ ^ ^2
execute as @e[tag=CORR_NERVES,type=!player] at @s run execute as @e[distance=..20,nbt={Brain:{}},tag=!NAN] at @s run execute at @e[distance=..1,limit=1,sort=nearest,tag=NAN_STOP_MOVE] run tp @s ^ ^ ^2
