-------------------------------------------------------------------------------
-- Italian localization (ChatGPT)
-------------------------------------------------------------------------------
if (GetLocale() ~= "itIT") then return end
local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "Disattivato: Conflitto con %s";
l.MSG_LOADED         = format("%s caricato e attivo", l.VERS_TITLE);

l.INIT_FAILED = format("%s non inizializzato correttamente (conflitto ?) !", l.VERS_TITLE);
