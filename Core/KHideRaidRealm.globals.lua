local addonName, ns = ...
ns.VERSION       = C_AddOns.GetAddOnMetadata(addonName, "Version");
ns.VERSIONNR     = tonumber(gsub(ns.VERSION, "%D", ""), 10);
local GetAddOnInfo = C_AddOns.GetAddOnInfo or GetAddOnInfo;
ns.ADDON_NAME,ns.TITLE, ns.NOTES = GetAddOnInfo(addonName);
ns.OPTIONS_NAME = nil; --"KHideRaidRealmOptions";

-- Kallye Raid Frames always loaded before
if (KRF_TITLE) then
	ns.CONFLICT_WITH, ns.CONFLICT = KRF_TITLE, true;
end


--@do-not-package@
-- Development icons
ns.TITLE = format("%s|TInterface/PVPFrame/Icons/prestige-icon-8-3:16|t", ns.TITLE)
--@end-do-not-package@


-- Prepare I18N, with chat colors
ns.I18N = {};
local l = ns.I18N;
local function BCC(r, g, b) return string.format("|cff%02x%02x%02x", (r*255), (g*255), (b*255)); end

l.RDL = BCC(1.0, 0.3, 0.3);
l.YLD = BCC(0.7, 0.7, 0.0);
l.YLL = BCC(1.0, 1.0, 0.5);
l.CY  = BCC(0.5, 1.0, 1.0);
l.DEFAULT = l.YLD


--[[
!  Default chat
]]
function ns.AddMsg(msg)
	if (DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage(format("%s%s|r", l.YLL, msg or ""));
	end
end
--[[
!  Warning chat
]]
function ns.AddMsgWarn(msg)
	if (DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage(format("%s%s|r", l.CY, msg or ""));
	end
end

--[[
!  Error chat
]]
function ns.AddMsgErr(msg)
	if (DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage(format("%s%s: %s|r", l.RDL, ns.TITLE, msg or ""));
	end
end

KHR_TITLE = ns.TITLE; -- global variable, for conflict detection

--@do-not-package@
-- DEBUG Purposes
KHR = ns
--@end-do-not-package@