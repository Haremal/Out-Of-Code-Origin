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
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run function corr:origin/tick/colorful
