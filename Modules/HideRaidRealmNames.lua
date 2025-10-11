local _, ns = ...
local l = ns.I18N;

-- * avoid conflict override
if ns.CONFLICT then return; end

local function ApplyFuncToRaidFrames(func, ...)
	for member = 1, 40 do
		local frame = _G["CompactRaidFrame"..member];
		if frame and frame:IsVisible() then
			func(frame, ...);
		end
	end
	for member = 1, 5 do
		local frame = _G["CompactPartyFrameMember"..member];
		if frame and frame:IsVisible() then
			func(frame, ...);
		end
	end
	-- Legacy
	for raid = 1, 8 do
		if _G["CompactRaidGroup"..raid] ~= nil and _G["CompactRaidGroup"..raid]:IsVisible() then
			for member = 1, 5 do
				local frame = _G["CompactRaidGroup"..raid.."Member"..member];
				if frame and frame:IsVisible() then
					func(frame, ...);
				end
			end
		end
	end
end

local function FrameIsCompact(frame)
	local getName = frame:GetName();
	return getName ~=nil and strsub(getName, 0, 7) == "Compact"
end
local startsWith = {
	play = true, -- player
	part = true, -- party
	raid = true,
}
local function UnitInPartyOrRaid(frame)
	return startsWith[strsub(frame.displayedUnit, 1, 4)];
	-- return UnitInParty(Unit) or UnitInRaid(Unit) or UnitIsUnit(Unit, "player")
end

--[[
! Manage player names (partyframes & nameplates)
- Hide realm
]]
local function Hook_CUF_UpdateName(frame, calledOutsideHook)
	if frame:IsForbidden() or not UnitPlayerControlled(frame.displayedUnit) then
		return
	end

	local name = frame.name
	-- if _G[ns.OPTIONS_NAME].HideRealm then
	local playerName, realm = UnitName(frame.displayedUnit)
	realm = realm or ""
	if realm ~= "" then
		name:SetText(playerName .. FOREIGN_SERVER_LABEL) -- (*)
	end
end

local function Hook_CUF_UpdateHealth(frame, _)
	if not frame:IsForbidden() and frame.background and UnitInPartyOrRaid(frame) and FrameIsCompact(frame) then
		Hook_CUF_UpdateName(frame, true)
	end
end


-- Will be used in standalone addon
local function getInfo(self)
    ns.AddMsg(l.MSG_LOADED);
end

local function onSaveOptions(self, options)
	if not ns._HideRealmHooked then
        ns._HideRealmHooked = true;
		hooksecurefunc("CompactUnitFrame_UpdateName", Hook_CUF_UpdateName);
		hooksecurefunc("CompactUnitFrame_UpdateHealthColor", Hook_CUF_UpdateHealth);
		if (CompactUnitFrame_UpdateHealPrediction) then
			--? Since DragonFlight (10)
			hooksecurefunc("CompactUnitFrame_UpdateHealPrediction", Hook_CUF_UpdateHealth);
		else
			--? Classic
			hooksecurefunc("CompactUnitFrame_UpdateHealth", Hook_CUF_UpdateHealth);
		end
    end
    ApplyFuncToRaidFrames(Hook_CUF_UpdateName, false);
end
local function onInit(self, options)
    onSaveOptions(self, options);
end

local module = ns.Module:new(onInit, "HideRaidRealmNames");
module:SetOnSaveOptions(onSaveOptions);
module:SetGetInfo(getInfo);