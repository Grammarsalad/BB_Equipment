::mods_registerMod("b_nets", 1, "Better nets");
::mods_hookNewObject("items/tools/throwing_net", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		onEquip();
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_net_repair")) 
		{
		  local skill = this.new("scripts/skills/actives/b_net_disarm");
		  this.addSkill(skill);
		  local skill = this.new("scripts/skills/actives/b_net_blind");
		  this.addSkill(skill);
		}

		}

  });
::mods_hookNewObject("items/tools/reinforced_throwing_net", function(o)
  {
    local onEquip = o.onEquip;
    o.onEquip = function()
		{
		//	this.weapon.onEquip();
		onEquip();
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_net_repair")) 
		{
		  local skill = this.new("scripts/skills/actives/legend_ninetails_disarm_skill");
		  this.addSkill(skill);
		  local skill = this.new("scripts/skills/actives/b_net_blind");
		  this.addSkill(skill);
		}

		}

  });
