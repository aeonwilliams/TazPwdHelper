-- Aeon Williams, Gerbo-Perenolde, 7/21

-- TODO: only do these checks if we're in the right location
-- TODO: only set the target marker if the target has changed

-- TODO: delete those you fuck
-- client_id:     b0dfeb9c98c94f7db682c439218e26b8
-- client_secret: rfbBlA0EE2M2RDhed29OH6Y27YaKRGYp

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

npc_items = {
  [185933]="Xy'nara",
  [185936]="Xy'har",
  [185935]="Xy'zaro",
  [185938]="Xy'aqida",
  [185932]="Xy'mal",
  [185909]="Xy'ghana",
  [185934]="Xy'jahid",
  [185939]="Xy'kitaab",
  [185937]="xy'tadir"
}

xydarid_items = {
  [185909]=true, -- dull opal, xy'ghana
  [185932]=true, -- damaged flask, xy'mal
  [185933]=true, -- cheap spices, xy'nara
  [185934]=true, -- cracked warhammer, xy'jahid
  [185935]=true, -- dusty skull, xy'zaro
  [185936]=true, -- common drum, xy'har
  [185937]=true, -- stale bread, xy'tadir
  [185938]=true, -- threadbare cloth, xy'aqida
  [185939]=true -- worn journal, xy'kitaab
}

event_started = false

-- local check_first_purchase = CreateFrame('Frame', nil, UIParent)
-- check_first_purchase:RegisterEvent("BAG_UPDATE")
-- check_first_purchase:SetScript("OnEvent", function()
--   if event_started then
--     check_first_purchase:Disable()
--     return
--   end
--   name, realm = UnitName("target")
--   if name == "Xy'darid" then
--     for i = 0, NUM_BAG_SLOTS do
--       for z = 1, GetContainerNumSlots(i) do
--         if xydarid_items[GetContainerItemID(i, z)] == true then
--           SelectNPC(math.random(8))
--           event_started = true
--           return
--         end
--       end
--     end
--   end
-- end)

function SelectNPC() -- item_id
  item_id = 185909
  target = npc_items[item_id]
  local b = CreateFrame('Button', "Button1", UIParent, "SecureActionButtonTemplate")
  b:SetSize(80,100)
  b:SetPoint("Center", 0, 100)
  b:SetNormalTexture("Interface\\Addons\\TazPwdHelper\\Textures\\Pause.blp")
  b:Show()
  b:SetAttribute("type", "macro")
  b:SetAttribute("macrotext", "/target "..target)
  b:SetScript("PostClick", function(self)
    SetRaidTarget("target", 6)
    self:Hide()
    self:Disable()
  end)
end
--
local temp = CreateFrame("Button", "Temp", UIParent)
temp:SetSize(20,20)
temp:SetPoint("Center")
temp:SetNormalTexture("Interface\\Addons\\TazPwdHelper\\Textures\\BLUEGRAD64.PNG")
temp:Show()
temp:SetScript("OnClick", SelectNPC)

-- on event UNIT_AURA, check for debuff from item
-- target NPC based on specific item clicked
