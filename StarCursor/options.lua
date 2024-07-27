-- Slash command to change color
SLASH_COLORCHANGE1 = "/StarColour"
SlashCmdList["COLORCHANGE"] = function(msg)
    local r, g, b = strsplit(" ", msg)
    r, g, b = tonumber(r), tonumber(g), tonumber(b)
    if r and g and b then
        local alpha = StarCursor.texture:GetAlpha()
        StarCursor.texture:SetVertexColor(r, g, b, alpha)
        StarCursorSettings.r, StarCursorSettings.g, StarCursorSettings.b = r, g, b
    end
end

-- Slash command to adjust alpha
SLASH_ALPHACHANGE1 = "/StarAlpha"
SlashCmdList["ALPHACHANGE"] = function(msg)
    local alpha = tonumber(msg)
    if alpha and alpha >= 0 and alpha <= 1 then
        StarCursor.texture:SetAlpha(alpha)
        StarCursorSettings.alpha = alpha
    end
end

-- Slash command for help
SLASH_HELP1 = "/StarHelp"
SlashCmdList["HELP"] = function()
    print("StarCursor Help:")
    print("/StarColour <r> <g> <b> - Change texture color (0-1)")
    print("/StarColour 1 1 1 - For white")
    print("/StarAlpha <alpha> - Change texture alpha (0-1)")
    print("/StarAlpha 1 - For full alpha")
end