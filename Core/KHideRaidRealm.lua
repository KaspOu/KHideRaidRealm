--[[
	Hello to K Hide Raid Realm Names
	Last version: @project-version@ (@project-date-iso@)
]]

local _, ns = ...
local l = ns.I18N;
local isInit = false;
local isLoaded = false;


local function SLASH_KHR_command(msgIn)
	if (not isLoaded) then
		ns.AddMsgWarn(l.INIT_FAILED);
		return;
	end

	ns.MODULES[1]:GetInfo();
end

local function SLASH_CLEAR_command()
	SELECTED_CHAT_FRAME:Clear()
end

local function OnEvent(self, event, ...)
	local arg1 = select(1, ...);
	if (event == "ADDON_LOADED" and arg1 == ns.ADDON_NAME) then
		self:UnregisterEvent("ADDON_LOADED");
		isLoaded = true;

		-- Load Module (standalone addon)
		local options = { HideRealm = true };
		ns.MODULES[1]:Init(options);
	end
end -- END ns.OnEvent

local function InitAddon(frame)

	SlashCmdList["KHR"] = SLASH_KHR_command;
	SLASH_KHR1 = "/khr";
	SLASH_KHR2 = "/hr";
	SLASH_KHR3 = "/hrn";
	SLASH_KHR4 = "/kallyehide";

	if (ns.CONFLICT) then
		ns.AddMsgErr(format(l.CONFLICT_MESSAGE, ns.CONFLICT_WITH));
		return;
	end

	SlashCmdList["CLEAR"] = SLASH_CLEAR_command;
	SLASH_CLEAR1 = "/clear";

	if (isInit or InCombatLockdown()) then return; end

	isInit = true;
	frame:SetScript("OnEvent",
		function(frame, event, ...)
			OnEvent(frame, event, ...);
		end
	);
	frame:RegisterEvent("ADDON_LOADED");
end



do
	local eventsFrame = CreateFrame("Frame", nil, UIParent)
	InitAddon(eventsFrame);
end
