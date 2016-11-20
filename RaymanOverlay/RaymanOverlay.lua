-- Rayman Overlay Script by Got4n/Scrimpeh
-- Aims to Display Some Useful Infos

-- Constants

while true do
local CAGES = memory.read_u32_le(0x1F8138)
local INVIC = memory.read_s16_le(0x1F61E2)
local PUNCH = memory.read_u8(0x1D8B34)
gui.drawImage("cage3.png", 640, 100, 100, 100) 
gui.drawText(740, 135, ":"..CAGES);
gui.drawText(640, 200, "Invincilibty:"..INVIC)
if PUNCH < 2 then
	gui.drawImage("punch4.png", 640, 250, 43, 40) 
else
	if PUNCH < 4 then
		gui.drawImage("punch6.png", 640, 250, 92, 40)
	else
if PUNCH > 7 and PUNCH < 10 then
	gui.drawImage("punch5.png", 640, 250, 43, 40) 
else
	gui.drawImage("punch7.png", 640, 250, 92, 40)
end
end
end
emu.frameadvance();
end