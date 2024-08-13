local addonName, addonTab = ...
local L = LibStub("AceLocale-3.0"):GetLocale("StarCursor", false)
addonTab.version = GetAddOnMetadata(addonName, "Version")

--{ StarCursor Options Panel }--

addonTab.panel = CreateFrame( "Frame", "StarCursorBlizzOptions", UIParent );
addonTab.panel.name = "StarCursor";

Settings.RegisterAddOnCategory( Settings.RegisterCanvasLayoutCategory(addonTab.panel, addonName) )

local category, layout = Settings.RegisterCanvasLayoutCategory(addonTab.panel, addonName);
    addonTab.STARCURSOR_CATEGORY_ID = category:GetID();

local fs = addonTab.panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
fs:SetPoint("TOPLEFT", 10, -15)
fs:SetPoint("BOTTOMRIGHT", addonTab.panel, "TOPRIGHT", 10, -45)
fs:SetJustifyH("LEFT")
fs:SetJustifyV("TOP")
fs:SetText("StarCursor")

local button = CreateFrame("Button", nil, addonTab.panel, "UIPanelButtonTemplate")
button:SetText(L['Configure'])
button:SetWidth(128)
button:SetPoint("TOPLEFT", 10, -48)
button:SetScript('OnClick', function()

    print("StarCursor: Options are planned for future updates. ")
end)

--{ Slash Commands }--
addonTab.slash = {}
local slash = addonTab.slash

function addonTab.ShowHelp()
    print(addonName.." Quick Commands List ("..addonTab.slash[1].."):")
	print("  "..addonTab.slash[2].." (c)onfig: Shows the "..addonName.." configuration settings panel.")
    print("  "..addonTab.slash[2].." (v)ersion: Shows the current version of "..addonName..".")
    print("Example: Typing \""..addonTab.slash[2].." v\" will show the current version of "..addonName..".")
end

function SlashCmdList_AddSlashCommand(name, func, ...)
	SlashCmdList[name] = func
	local cmd = ""
	for i = 1, select('#', ...) do
		cmd = select(i, ...)
		if strsub(cmd, 1, 1) ~= "/" then
			cmd = "/" .. string.lower(cmd)
		end
		_G["SLASH_"..name..i] = cmd
		addonTab.slash[i] = _G["SLASH_"..name..i]
		slash[i] = addonTab.slash[i]
	end
end

SlashCmdList_AddSlashCommand(string.upper(addonName), function(msg)
	local cmd = string.lower(msg)
    if (cmd == "config") or (cmd == "c") then
        Settings.OpenToCategory(addonTab.STARCURSOR_CATEGORY_ID-1)
    elseif (cmd == "version") or (cmd == "v") then
		print(addonName.." Version:", addonTab.version)
    else
		addonTab.ShowHelp()
    end
end, addonName, 'sc') --{ Slash Commands: /addonName - addonTab.slash[1], /sc - addonTab.slash[2]
DEFAULT_CHAT_FRAME:AddMessage(addonName.." v"..addonTab.version.." initialized. Type "..addonTab.slash[1].." or "..addonTab.slash[2].." for usage.", 0, 192, 255)
