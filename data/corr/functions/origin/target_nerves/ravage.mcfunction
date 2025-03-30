execute as @e[distance=..15,nbt={Brain:{}},tag=!NAN] at @s run playsound minecraft:entity.generic.explode ambient @a[distance=..150] ~ ~ ~ 1 2 1
execute as @e[distance=..15,nbt={Brain:{}},tag=!NAN] at @s run summon minecraft:block_display ~ ~ ~ {view_range:1000f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.01f,0.01f,10f]},Tags:["NAN","RAVAGE","WOOL"]}
execute as @e[distance=..15,nbt={Brain:{}},tag=!NAN] at @s run execute if score CameraShake Timer matches 0 run tp @e[tag=RAVAGE,limit=1,sort=nearest] ^-4 ^2 ^ facing entity @s eyes
execute as @e[distance=..15,nbt={Brain:{}},tag=!NAN] at @s run execute if score CameraShake Timer matches 1 run tp @e[tag=RAVAGE,limit=1,sort=nearest] ^4.5 ^1.5 ^ facing entity @s eyes
execute as @e[distance=..15,nbt={Brain:{}},tag=!NAN] at @s run damage @s 4
execute as @e[distance=..15,nbt={Brain:{}},tag=!NAN] at @s run setblock ~ ~-1 ~ air destroy
