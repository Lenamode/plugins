local COMMAND = Clockwork.command:New("DoorSetPassword");
COMMAND.tip = "Set a door's password.";
COMMAND.text = "<string Pass>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	function COMMAND:OnRun(player, arguments)
	local door = player:GetEyeTraceNoCursor().Entity;
	
	if (IsValid(door) and Clockwork.entity:IsDoor(door)) then
				
				trace.Entity.cwPassword = table.concat(arguments, " ");
				
				Clockwork.player:Notify(player, "This door's password has been set to '"..trace.Entity.cwPassword.."'.");
			else
				Clockwork.player:Notify(player, "This is not a valid door!");
			end;
		else
			Clockwork.player:Notify(player, "This is not a valid door!");
		end;
	else
		Clockwork.player:Notify(player, "This is not a valid door!");
	end;
end;

COMMAND:Register();