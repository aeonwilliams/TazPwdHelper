-- TODO: delete those you fuck
-- client_id:     b0dfeb9c98c94f7db682c439218e26b8
-- client_secret: rfbBlA0EE2M2RDhed29OH6Y27YaKRGYp

local player_name = UnitName("player")
message("Hello ".. player_name ..", Welcome to Azeroth!")

npc_names = {"Xy'aro", "Xy'nara", "Xy'har", "Xy'zaro", "Xy'aqida", "Xy'mal", "Xy'ghana", "Xy'jahid", "Xy'kitaab"}

function SelectNPC()
  target = npc_names[math.random(8)]
  -- temp:Hide()
  -- temp:Disable()
  local b = CreateFrame('Button', "Button1", UIParent, "SecureActionButtonTemplate")
  b:SetSize(80,100)
  b:SetPoint("Center", - 50, -50)
  b:SetNormalTexture("Interface\\Addons\\TazPwdHelper\\Textures\\Pause.blp")
  b:Show()
  b:SetAttribute("type", "macro")
  b:SetAttribute("macrotext", "/target "..target)
  b:SetScript("PostClick", function(b)
    SetRaidTarget("target", 6)
    b:Hide()
    b:Disable()
  end)
end

local temp = CreateFrame("Button", "Temp", UIParent)
temp:SetSize(20,20)
temp:SetPoint("Center")
temp:SetNormalTexture("Interface\\Addons\\TazPwdHelper\\Textures\\BLUEGRAD64.PNG")
temp:Show()
temp:SetScript("OnClick", SelectNPC)

-- on event UNIT_AURA, check for debuff from item
-- target NPC based on specific item clicked

-- Xy'aro : Overpriced Art
-- Xy'nara : Exotic Spices
-- Xy'har Fancy Instruments
-- Xy'zaro : Fossil Collector
-- Xy'aqida : Expert Tailor
-- Xy'tadir : Fine Cuisine
-- Xy'mal : Alchemist
-- Xy'ghana : Precious Gemstones
-- Xy'jahid : Magical Weapons
-- Xy'kitaab : Rare Texts

-- local frame = CreateFrame("FRAME", "TestAddonFrame")
-- frame:RegisterEvent("PLAYER_ENTERING_WORLD")
-- local function eventHandler(self, event, ...)
--   print("WE LOOOOAADDEEEDDDDDDD")
-- end
-- frame:SetScript("OnEvent", eventHandler)
