--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

Clockwork.config:AddToSystem("Maximum safebox weight", "max_safebox_weight", "The maximum weight a player's safebox can hold.", 0, 300);

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SaveBooks();
end;