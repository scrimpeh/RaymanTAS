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
 

function advance_frames(val)
	for i=0,val,1 do
		emu.frameadvance();
	end
end
 
-- Sets up the save states

-- Variables
filename = "ringres1.txt"
x_start = 3520;  
x_end = 3650;
y_start = 400;
y_end = 475;

x_inc = 1;
y_inc = 1;

--Preparation
savestate.save("rayman_ringtest");
savestate.load("rayman_ringtest");
 
emu.limitframerate(false);

--Main Loop
for x = x_start, x_end, x_inc do
	for y = y_start, y_end, y_inc do 
		savestate.load("rayman_ringtest"); 
		set_xy(x, y);
		advance_frames(2);
		
		--Evaluate the result
		file = io.open(filename, "a");
		file:write(string.format("%d,%d,%d,%d\n",x,y,memory.read_s16_le(X_SPEED),memory.read_s16_le(Y_SPEED)));
		file:close()
		
		emu.yield();	
	end
end

emu.limitframerate(true);