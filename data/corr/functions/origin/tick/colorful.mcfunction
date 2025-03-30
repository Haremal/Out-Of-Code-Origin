# SETUP
scoreboard players add NaNBiome Timer 1
execute if score NaNBiome Timer matches 6.. run scoreboard players set NaNBiome Timer 0
# GLITCHY EYES
item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:coast"}}
item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:dune"}}
item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:host"}}
item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:raiser"}}
item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:rib"}}
item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:sentry"}}
item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:eye"}}
execute if score NaNBiome Timer matches 0 run item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:coast"}}
execute if score NaNBiome Timer matches 1 run item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:dune"}}
execute if score NaNBiome Timer matches 2 run item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:host"}}
execute if score NaNBiome Timer matches 3 run item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:raiser"}}
execute if score NaNBiome Timer matches 4 run item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:rib"}}
execute if score NaNBiome Timer matches 5 run item replace entity @a[tag=CORR] armor.head with minecraft:chainmail_helmet{Trim:{material:"minecraft:iron",pattern:"minecraft:sentry"}}
# CLONES GLITCHY EYES
item replace entity @e[tag=CORR_CLONE] armor.head from entity @s armor.head
# COLORFUL SKY IN DIMENSION
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_1
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_2
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_3
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_4
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_5
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_6
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_7
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_8
execute at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_9
execute if score NaNBiome Timer matches 0 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_2
execute if score NaNBiome Timer matches 1 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_3
execute if score NaNBiome Timer matches 2 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_1
execute if score NaNBiome Timer matches 3 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_4
execute if score NaNBiome Timer matches 4 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_7
execute if score NaNBiome Timer matches 5 at @a[nbt={Dimension:"corr:out_of_code_dimension"}] run fillbiome ~-15 ~-1 ~-15 ~15 ~15 ~15 corr:nan_biome_9
