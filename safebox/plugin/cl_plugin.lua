--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

function PLUGIN:LoadPersonalStorage()
	self.personalStorage = {};
	
	local personalStorage = Clockwork.kernel:RestoreSchemaData("plugins/personal/"..game.GetMap());
	
	for k, v in pairs(personalStorage) do
		local data = {
			position = v.position,
			angles = v.angles
		};
		
		data.entity = ents.Create("cw_safebox");
		data.entity:SetAngles(data.angles);
		data.entity:SetPos(data.position);
		data.entity:Spawn();
		
		data.entity:GetPhysicsObject():EnableMotion(false);
		self.personalStorage[#self.personalStorage + 1] = data;
	end;
end;

Clockwork.config:AddToSystem("Maximum safebox weight", "max_safebox_weight", "The maximum weight a player's safebox can hold.", 0, 300);

