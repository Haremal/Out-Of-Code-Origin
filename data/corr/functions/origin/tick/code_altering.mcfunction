# EXIT (CORRUPTED)
    # SETUP
    execute if score CorruptedTP Timer matches 1.. run scoreboard players add CorruptedTP Timer 1
    execute if score CorruptedTP Timer matches 1.. run scoreboard players set @a[tag=CORR] Timer 0
    # ALTER BOTTOM
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 1 run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 3 run fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 5 run fill ~-5 ~-1 ~-5 ~5 ~-1 ~5 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 7 run fill ~-7 ~-1 ~-7 ~7 ~-1 ~7 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 9 run fill ~-10 ~-1 ~-10 ~10 ~-1 ~10 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 11 run fill ~-12 ~-1 ~-12 ~12 ~-1 ~12 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 13 run fill ~-15 ~-1 ~-15 ~15 ~-1 ~15 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 15 run fill ~-17 ~-1 ~-17 ~17 ~-1 ~17 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 17 run fill ~-20 ~-1 ~-20 ~20 ~-1 ~20 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 19 run fill ~-22 ~-1 ~-22 ~22 ~-1 ~22 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 21 run fill ~-25 ~-1 ~-25 ~25 ~-1 ~25 black_concrete
    # ALTER TOP
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 1 run fill ~-1 ~5 ~-1 ~1 ~5 ~1 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 3 run fill ~-3 ~5 ~-3 ~3 ~5 ~3 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 5 run fill ~-5 ~5 ~-5 ~5 ~5 ~5 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 7 run fill ~-7 ~5 ~-7 ~7 ~5 ~7 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 9 run fill ~-10 ~5 ~-10 ~10 ~5 ~10 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 11 run fill ~-12 ~5 ~-12 ~12 ~5 ~12 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 13 run fill ~-15 ~5 ~-15 ~15 ~5 ~15 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 15 run fill ~-17 ~5 ~-17 ~17 ~5 ~17 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 17 run fill ~-20 ~5 ~-20 ~20 ~5 ~20 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 19 run fill ~-22 ~5 ~-22 ~22 ~5 ~22 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 21 run fill ~-25 ~5 ~-25 ~25 ~5 ~25 black_concrete
    # ALTER MIDDLE
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 1 run fill ~-1 ~ ~-1 ~1 ~4 ~1 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 3 run fill ~-3 ~ ~-3 ~3 ~4 ~3 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 5 run fill ~-5 ~ ~-5 ~5 ~4 ~5 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 7 run fill ~-7 ~ ~-7 ~7 ~4 ~7 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 9 run fill ~-10 ~ ~-10 ~10 ~4 ~10 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 11 run fill ~-12 ~ ~-12 ~12 ~4 ~12 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 13 run fill ~-15 ~ ~-15 ~15 ~4 ~15 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 15 run fill ~-17 ~ ~-17 ~17 ~4 ~17 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 17 run fill ~-20 ~ ~-20 ~20 ~4 ~20 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 19 run fill ~-22 ~ ~-22 ~22 ~4 ~22 air
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 21 run fill ~-25 ~ ~-25 ~25 ~4 ~25 air
    # ALTER WALLS
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 21 run fill ~25 ~5 ~25 ~25 ~-1 ~-25 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 21 run fill ~25 ~5 ~25 ~-25 ~-1 ~25 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 21 run fill ~-25 ~5 ~-25 ~25 ~-1 ~-25 black_concrete
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 21 run fill ~-25 ~5 ~-25 ~-25 ~-1 ~25 black_concrete
    # ALTER DELETE
    execute at @a[tag=CORR] if score CorruptedTP Timer matches 30.. run fill ~-25 ~-1 ~-25 ~25 ~5 ~25 air
    # TP
    execute as @a[tag=CORR] at @s if score CorruptedTP Timer matches 30.. run execute as @e[distance=..25,tag=!NAN,nbt={Brain:{}}] at @s in corr:out_of_code_dimension run tp @s ~ 1 ~
    execute as @a[tag=CORR] at @s if score CorruptedTP Timer matches 30.. run function corr:origin/glitch/exit/out
    # RESET
    execute if score CorruptedTP Timer matches 30.. run scoreboard players set CorruptedTP Timer 0
# DISTORT
    # SETUP
    execute if entity @e[tag=DISTORT] run scoreboard players add DISTORTION Timer 1
    execute unless entity @e[tag=DISTORT] run scoreboard players set DISTORTION Timer 0
    execute if score DISTORTION Timer matches 20.. run tag @e[tag=DISTORT] remove DISTORT


