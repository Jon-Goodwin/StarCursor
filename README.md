# StarCursor Addon

## Major Fixes
1. Fixed an issue which would cause the cursor to be locked at max size and brightness
2. Fixed an issue where the cursor speed would lag the cursor at certain frame rates
3. Fixed an issue where the options file called a nonexistent function

## Currently I have no plans to add additional features.
There is an ability to change the size and alpha of the glow effect:

texture:SetAlpha(0.5) in core.lua will change the glow effect

local SIZE_MODIFIER = 6; in core.lua will change the how the size scales with speed

local MIN_SIZE = 16; in core.lua will set the minimum size of the texture
