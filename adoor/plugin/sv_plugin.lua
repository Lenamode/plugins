Clockwork.datastream:Hook("DoorPassword", function(player, argments)
	local password = data[1];
	local entity = data[2];
	
	if (IsValid(door) and Clockwork.entity:IsDoor(door)) then
		(entity.cwPassword == password) then
		door:EmitSound("doors/door_latch3.wav");
		door:Fire("Unlock", "", 0);
	else
				Clockwork.player:Notify(player, "You have entered an incorrect password!");
			end;
		end;
	end);


-- A function to save the door data.
function cwDoorCmds:SaveDoorData()
	local doorData = {};
	
	for k, v in pairs(self.doorData) do
		local data = {
			customName = v.customName,
			position = v.position,
			name = v.name,
			text = v.text
			pass = v.pass
		};
		
		doorData[#doorData + 1] = data;
	end;