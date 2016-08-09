-- Lua Script by Got4n/Scrimpeh
-- Controls Rayman speed during a boost
-- Launch it two frames before you get the boost (I think? pls scrimpeh confirm it)
-- Addresses
X_ADDR = 0x1F61BC;
Y_ADDR = 0x1F61BE;
COND_ADDR = 0x1F61CC;
 
-- Control values; number of frames to advance and how many times to test
NUM_FRAMES = 30;
NUM_ITER = 1000;
 
-- Sets the RNG to val; assumes a 16-bit RNG
function set_X(val)
    mainmemory.write_u16_le(X_ADDR,val);
end
 
 -- Sets the RNG to val; assumes a 16-bit RNG
function set_Y(val)
    mainmemory.write_u16_le(Y_ADDR,val);
end
 
-- Function that checks whether the condition and reports whatever information
-- you are trying to track from it.
function check_cond()
 
    cond = mainmemory.read_u16_le(COND_ADDR);
    if(cond ~= 5) then
        mycount = mycount+1;
    end;
   
end
 
function advance_frames(val)
    for i=0,val,1 do
        emu.frameadvance();
    end
end
 
-- Sets up the save states
savestate.save("rayman");
savestate.load("rayman");
 
emu.limitframerate(false);
   
mycount = 0;
   
-- Main testing loop
for i=0,NUM_ITER,1 do
-- Grab a random value to set the RNG to; adjust size as necessary
   for k = 415, 580, 1 do
   for j = 3250,3450,1 do 
	savestate.load("rayman"); 
	set_Y(k)
    set_X(j);
	advance_frames(2)
	check_cond();
	emu.yield()
	end
end
end
   
emu.limitframerate(true);