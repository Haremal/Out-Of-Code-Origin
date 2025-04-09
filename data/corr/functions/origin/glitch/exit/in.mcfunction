execute if score corrDim Position matches 0 run execute in minecraft:overworld run tp @s ~ ~ ~
execute if score corrDim Position matches 1 run execute in minecraft:the_nether run tp @s ~ ~ ~
execute if score corrDim Position matches 2 run execute in minecraft:the_end run tp @s ~ ~ ~
execute if score corrDim Position matches 0 in minecraft:overworld run spreadplayers ~ ~ 0 1 false @s
execute if score corrDim Position matches 1 in minecraft:the_nether run spreadplayers ~ ~ 0 1 false @s
execute if score corrDim Position matches 2 in minecraft:the_end run spreadplayers ~ ~ 0 1 false @s
function corr:origin/areal_nerves/spread/removal
scoreboard players set @s Corruption 0