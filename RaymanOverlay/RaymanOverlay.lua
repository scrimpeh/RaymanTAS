-- Rayman Overlay Script by Got4n/Scrimpeh
-- Aims to Display Some Useful Infos

-- Constants
local CAGES = memory.read_u32_le(0x1F8138)
local INVIC = memory.read_s16_le(0x1F61E2)
local PUNCH = memory.read_u8(0x1D8B34)

while true do
gui.drawImage("cage3.png", 640, 100, 100, 100) 
gui.drawText(740, 135, ":"..CAGES);
gui.drawText(640, 200, "Invincilibty:"..INVIC)
if PUNCH < 2 then
	gui.drawImage("punch4.png", 640, 250, 43, 40) 
else
if PUNCH > 7 then
	gui.drawImage("punch5.png", 640, 250, 43, 40) 
end
emu.frameadvance();
end
end