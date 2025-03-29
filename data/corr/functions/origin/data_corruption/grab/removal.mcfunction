kill @e[tag=THROW,scores={Timer=5..}]
execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] levitation
execute if entity @e[tag=THROW,scores={Timer=4..}] run effect clear @e[tag=GRABBED] glowing
execute unless entity @e[tag=THROW] run tag @e[tag=GRABBED] remove GRABBED
execute unless entity @e[tag=THROW] run kill @e[name=grabbed_data,type=text_display]