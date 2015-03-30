Clockwork.datastream:Hook("DoorPassword", function(data)
	local entity = data;
	
	Derma_StringRequest("Password", "What is the password for this door?", nil, function(text)
		Clockwork.datastream:Start("DoorPassword", {text, entity});
	end);
end);