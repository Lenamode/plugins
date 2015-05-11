--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

-- Called when an entity's menu options are needed.
function PLUGIN:GetEntityMenuOptions(player, entity, option, arguments)
	local class = entity:GetClass();
	
	if (entity:GetClass() == "cw_safebox" and arguments == "cwSafeboxOpen") then
			local cash = player:GetCharacterData("safeboxcash");
			local weight = Clockwork.config:Get("max_safebox_weight"):Get();
			local inventory = player:GetCharacterData("safeboxitems");
	 
			if (PhaseFour.augments:Has(player, AUG_OBSESSIVE)) then
				weight = weight * 3;
			end;
	 
			Clockwork.storage:Open(player, {
				name = "Safebox",
				weight = weight,
				entity = entity,
				distance = 192,
				cash = cash,
				inventory = inventory,
				OnGiveCash = function(player, storageTable, cash)
					player:SetCharacterData("safeboxcash", storageTable.cash);
				end,
				OnTakeCash = function(player, storageTable, cash)
					player:SetCharacterData("safeboxcash", storageTable.cash);
				end
			});
		elseif (entity:GetClass() == "cw_breach" and arguments == "cwBreachCharge") then
			entity:CreateDummyBreach();
			entity:BreachEntity(player);
		end;
	end;


function PLUGIN:PlayerSaveCharacterData(player, data)
	if (data["safeboxitems"]) then
		local curSysTime = SysTime();
		data["safeboxitems"] = Clockwork.inventory:ToSaveable(data["safeboxitems"]);
		print("Took: "..(SysTime() - curSysTime));
	end;
end;

function PLUGIN:PlayerDoesHaveItem(player, itemTable)
	local safebox = player:GetCharacterData("safeboxitems");
	
	if (safebox and safebox[itemTable("uniqueID")]) then
		return safebox[itemTable("uniqueID")];
	end;
end;

