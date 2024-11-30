::mods_registerMod("mod_b_crossbows", 1.0, "Bashing Crossbows and Handgonnes");
::mods_queue("mod_b_crossbows", "mod_msu, >mod_legends", function()
{
	local xbows = [
		"heavy_crossbow",
		"crossbow",
		"light_crossbow",
		"oriental/handgonne",
		"greenskins/goblin_crossbow",
		"named/named_crossbow"
		"named/named_handgonne"
	];

	local hxbows = [
		"heavy_crossbow",
		"oriental/handgonne",
		"greenskins/goblin_crossbow",
		"named/named_crossbow"
		"named/named_handgonne"
	];

	foreach(xbow in xbows)
	{
		::mods_hookExactClass("items/weapons/" + xbow, function(o) {
			local onEquip = o.onEquip;
			o.onEquip = function ()
			{
				onEquip();
				::logInfo("creating xbows");
				this.addSkill(this.new("scripts/skills/actives/bash"));
			}
		});
	}

	foreach(hxbow in hxbows)
	{
		::mods_hookExactClass("items/weapons/" + hxbow, function(o) {
			local onEquip = o.onEquip;
			o.onEquip = function ()
			{
				onEquip();
				::logInfo("creating hxbows");
				this.addSkill(this.new("scripts/skills/actives/knock_out"));
			}
		});
	}

});