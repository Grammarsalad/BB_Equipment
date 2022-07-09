::mods_registerMod("b_crossbows", 1, "Bashing Guns & Crossbows");
::mods_hookNewObject("items/weapons/heavy_crossbow", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		        onEquip();
                        this.addSkill(this.new("scripts/skills/actives/bash"));
		        this.addSkill(this.new("scripts/skills/actives/knock_out"));

		}

  });
::mods_hookNewObject("items/weapons/oriental/handgonne", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		        onEquip();
                        this.addSkill(this.new("scripts/skills/actives/bash"));
		        this.addSkill(this.new("scripts/skills/actives/knock_out"));

		}

  });
  ::mods_hookNewObject("items/weapons/greenskins/goblin_crossbow", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		        onEquip();
                        this.addSkill(this.new("scripts/skills/actives/bash"));
		        this.addSkill(this.new("scripts/skills/actives/knock_out"));

		}

  });
    ::mods_hookNewObject("items/weapons/named/named_crossbow", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		        onEquip();
                        this.addSkill(this.new("scripts/skills/actives/bash"));
		        this.addSkill(this.new("scripts/skills/actives/knock_out"));

		}

  });