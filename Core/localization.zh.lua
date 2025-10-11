-------------------------------------------------------------------------------
-- Chinese localization (ChatGPT)
-------------------------------------------------------------------------------
if (GetLocale() ~= "zhCN" and GetLocale() ~= "zhTW") then return end
local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "已禁用：与 %s 冲突";
l.MSG_LOADED         = format("%s 已加载并激活", l.VERS_TITLE);

l.INIT_FAILED = format("%s 未正确加载（冲突？）！", l.VERS_TITLE);
