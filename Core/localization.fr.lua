-------------------------------------------------------------------------------
-- French localization
-------------------------------------------------------------------------------
if (GetLocale() ~= "frFR") then return end
local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "D\195\169sactiv\195\169 : Conflit avec %s";
l.MSG_LOADED         = format("%s lanc\195\169 et actif", l.VERS_TITLE);

l.INIT_FAILED = format("%s pas charg\195\169 correctement (conflit ?) !", l.VERS_TITLE);

--@do-not-package@
-- https://code.google.com/archive/p/mangadmin/wikis/SpecialCharacters.wiki
-- https://wowwiki.fandom.com/wiki/Localizing_an_addon
--@end-do-not-package@
