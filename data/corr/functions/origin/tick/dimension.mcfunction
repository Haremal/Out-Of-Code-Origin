# STORE POSITION
execute store result score corrPosX Position run data get entity @a[tag=CORR,limit=1] Pos[0]
execute store result score corrPosY Position run data get entity @a[tag=CORR,limit=1] Pos[1]
execute store result score corrPosZ Position run data get entity @a[tag=CORR,limit=1] Pos[2]
# CALCULATE UNIVERSE
scoreboard players operation corrDim Position = corrPosX Position
scoreboard players operation corrDim Position += corrPosZ Position
scoreboard players operation corrDim Position /= Ten Timer
scoreboard players operation corrDim Position %= Three Timer
# ACTION BAR POSITION DISPLAY
execute as @a[tag=CORR,nbt={Dimension:"corr:out_of_code_dimension"}] run title @s actionbar ["Universe: ",{"color":"light_purple","score":{"name":"corrDim","objective":"Position"}}," X: ",{"color":"light_purple","score":{"name":"corrPosX","objective":"Position"}}," Y: ",{"color":"light_purple","score":{"name":"corrPosY","objective":"Position"}}," Z: ",{"color":"light_purple","score":{"name":"corrPosZ","objective":"Position"}}]
# EFFECTS
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run function corr:origin/tick/colorful
power grant @a[nbt={Dimension:"corr:out_of_code_dimension"}] corr:for_enemies_deconverge
power remove @a[nbt=!{Dimension:"corr:out_of_code_dimension"}] corr:for_enemies_deconverge
power remove @a[nbt={Dimension:"corr:out_of_code_dimension"}] corr:for_enemies_desaturate
# STOPPING
execute as @e[tag=!NAN,nbt={Brain:{}}] at @s if dimension corr:out_of_code_dimension run execute unless entity @e[tag=DIM_STOP,distance=..1] run summon minecraft:block_display ~ ~ ~ {Tags:["DIM_STOP","NAN"]}
execute as @e[tag=DIM_STOP,scores={Timer=..1}] at @s run data modify entity @s Rotation set from entity @e[tag=!NAN,distance=..1,limit=1,sort=nearest] Rotation
execute as @e[tag=DIM_STOP,scores={Timer=2..}] at @s run tp @e[tag=!NAN,distance=..1] @s
execute as @e[tag=DIM_STOP] at @s run execute unless entity @e[distance=..1,tag=!NAN,limit=1,sort=nearest] run kill @s
# CORRUPTING
execute as @e[tag=!NAN,nbt={Brain:{}}] at @s if dimension corr:out_of_code_dimension if score NaNBiome Timer matches 0 run scoreboard players add @s Corruption 1
execute as @e[tag=!NAN,nbt={Brain:{}}] at @s if dimension corr:out_of_code_dimension run damage @s 0.0000000001
execute as @a[tag=CORR] at @s if dimension corr:out_of_code_dimension run scoreboard players set @s Corruption 100
