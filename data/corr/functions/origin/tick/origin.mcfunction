# BECOME ORIGIN
execute if entity @a[tag=CORR] run origin gui @a[tag=!CORR,nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] origins:origin
execute unless entity @a[tag=CORR] run tag @a[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add CORR
tag @a[tag=CORR] add NAN
# ARMOR
item replace entity @a[tag=CORR,nbt=!{Dimension:"corr:out_of_code_dimension"}] armor.head with minecraft:chainmail_helmet
item replace entity @a[tag=CORR] armor.chest with minecraft:chainmail_chestplate
item replace entity @a[tag=CORR] armor.legs with minecraft:chainmail_leggings
item replace entity @a[tag=CORR] armor.feet with minecraft:chainmail_boots
execute as @a[tag=CORR] run attribute @s minecraft:generic.armor modifier add f3b9a5d2-8e04-4a8f-b670-2e63c2b5c9c4 armor_reducer -100 add
stopsound @a * minecraft:item.armor.equip_chain
# VISION
execute as @a[tag=CORR] at @s run power grant @a[distance=..100,nbt=!{Dimension:"corr:out_of_code_dimension"}] corr:for_enemies_desaturate
execute as @a[tag=CORR] at @s run power remove @a[distance=101..] corr:for_enemies_desaturate
# REMOVE ORIGIN
tag @a[nbt=!{ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] remove CORR
nanhealth @a[nbt=!{ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}},limit=1,tag=NAN] unset
tag @a[tag=!CORR] remove NAN
execute as @a[tag=!CORR] run attribute @s minecraft:generic.armor modifier remove f3b9a5d2-8e04-4a8f-b670-2e63c2b5c9c4
