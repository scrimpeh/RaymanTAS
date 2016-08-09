-- Lua Script by Got4n/scrimpeh
-- Checks Rayman speed during a boost
-- Launch it two frames before you get the boost (I think? pls scrimpeh confirm it)
-- Addresses

-- Constants
RAYMAN_X = 0x1F61BC;
RAYMAN_Y = 0x1F61BE;

CAMERA_X = 0x1F84B8;
CAMERA_Y = 0x1F84C0;

X_SPEED = 0x1F61CC;
Y_SPEED = 0x1F61CE;
 
function set_xy(x, y)
-- Set Rayman Position
	mainmemory.write_u16_le(RAYMAN_X, x);
	mainmemory.write_u16_le(RAYMAN_Y, y);
-- Write Camera
	mainmemory.write_u16_le(CAMERA_X, x - 96);
	mainmemory.write_u16_le(CAMERA_Y, y - 96);
end
 
function check_result()
	-- TODO: Do something useful here!
	-- -scrimpeh
end
 
function advance_frames(val)
	for i=0,val,1 do
		emu.frameadvance();
	end
end
 
-- Sets up the save states
savestate.save("rayman_ringtest");
savestate.load("rayman_ringtest");
 
emu.limitframerate(false);
   
-- Variables
x_start = 3260;  
x_end = 3450;
y_start = 415;
y_end = 580;

x_inc = 1;
y_inc = 1;

-- Main testing loop
for x = x_start, x_end, x_inc do
	for y = y_start, y_end, y_inc do 
		savestate.load("rayman_ringtest"); 
		set_xy(x, y);
		advance_frames(2);
		check_result();
		emu.yield();
	end
end

emu.limitframerate(true);