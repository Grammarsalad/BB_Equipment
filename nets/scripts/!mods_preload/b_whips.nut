::mods_registerMod("b_whips", 1, "Whip'em into shape");
::mods_hookNewObject("items/weapons/battle_whip", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		        onEquip();
                //        this.addSkill(this.new("scripts/skills/actives/crack_the_whip_skill"));

		}

  });
::mods_hookNewObject("items/weapons/barbarians/thorned_whip", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		        onEquip();
                //        this.addSkill(this.new("scripts/skills/actives/crack_the_whip_skill"));

		}

  });
::mods_hookNewObject("items/weapons/barbarians/named_battle_whip", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		        onEquip();
                //        this.addSkill(this.new("scripts/skills/actives/crack_the_whip_skill"));

		}

  });
