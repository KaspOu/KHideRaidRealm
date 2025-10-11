-------------------------------------------------------------------------------
-- German localization (ChatGPT)
-------------------------------------------------------------------------------
if (GetLocale() ~= "deDE") then return end
local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "Deaktiviert: Konflikt mit %s";
l.MSG_LOADED         = format("%s geladen und aktiv", l.VERS_TITLE);

l.INIT_FAILED = format("%s nicht korrekt geladen (Konflikt ?)!", l.VERS_TITLE);
