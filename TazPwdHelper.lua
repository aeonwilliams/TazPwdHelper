-- TODO: delete those you fuck
-- client_id:     b0dfeb9c98c94f7db682c439218e26b8
-- client_secret: rfbBlA0EE2M2RDhed29OH6Y27YaKRGYp

function TazPwdHelper_OnLoad(self)
  print("Hello Azeroth")
  local player_name = UnitName("player")
  message("Hello ".. player_name ..", Welcome to Azeroth!")
end
