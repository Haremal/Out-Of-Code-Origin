# SETUP
execute if entity @a[tag=CORR] run origin set @a[tag=!CORR,nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] origins:origin origins:human
execute unless entity @a[tag=CORR] run tag @a[nbt={ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] add CORR
tag @a[tag=CORR] add NAN
# scoreboard players set @a[tag=CORR] Corruption 100
# ARMOR
item replace entity @a[tag=CORR,nbt=!{Dimension:"corr:out_of_code_dimension"}] armor.head with minecraft:chainmail_helmet
item replace entity @a[tag=CORR] armor.chest with minecraft:chainmail_chestplate
item replace entity @a[tag=CORR] armor.legs with minecraft:chainmail_leggings
item replace entity @a[tag=CORR] armor.feet with minecraft:chainmail_boots
# REMOVAL
tag @a[nbt=!{ForgeCaps:{"origins:origins":{Origins:{"origins:origin":"corr:corr"}}}}] remove CORR
tag @a[tag=!CORR] remove NAN