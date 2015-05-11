--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

function PLUGIN:PlayerSaveCharacterData(player, data)
	if (data["safeboxitems"]) then
		local curSysTime = SysTime();
		data["safeboxitems"] = Clockwork.inventory:ToSaveable(data["safeboxitems"]);
		print("Took: "..(SysTime() - curSysTime));
	end;
end;

function PhaseFour:PlayerRestoreCharacterData(player, data)
		data["safeboxitems"] = Clockwork.inventory:ToLoadable(data["safeboxitems"] or {});
	data["safeboxcash"] = data["safeboxcash"] or 0;
end;

	Clockwork.kernel:SaveSchemaData("plugins/safebox/"..game.GetMap(), safebox);
end;