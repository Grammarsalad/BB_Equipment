this.b_net_distract <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.b_net_distract";
		this.m.Name = "Throw Net";
		this.m.Description = "Use a net to distract your opponents, inflicting the \'Overwhelmed\' status effect on them, which lowers both Melee Skill and Ranged Skill by [color=" + this.Const.UI.Color.NegativeValue + "]5%[/color] for one turn.\n\nThe effect stacks with each use.";
		this.m.Icon = "skills/active_73.png";
		this.m.IconDisabled = "skills/active_73_sw.png";
		this.m.Overlay = "active_73";
		this.m.SoundOnUse = [
			"sounds/combat/throw_net_01.wav",
			"sounds/combat/throw_net_02.wav"
		];
		this.m.SoundOnHitHitpoints = [
			"sounds/combat/break_free_net_01.wav",
			"sounds/combat/break_free_net_02.wav",
			"sounds/combat/break_free_net_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = true;
		this.m.IsAttack = true;
		this.m.IsOffensiveToolSkill = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.MaxLevelDifference = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles"
			}
		]);
		return ret;
	}
	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInNets ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}
	
-- CONTINUE

	function onUse( _user, _targetTile )
	{
		local success = this.attackEntity(_user, _targetTile.getEntity());

		if (success)
		{
			local target = _targetTile.getEntity();

			if (!target.getCurrentProperties().IsStunned && !target.getCurrentProperties().IsImmuneToDisarm)
			{
				target.getSkills().add(this.new("scripts/skills/effects/disarmed_effect"));

				if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has disarmed " + this.Const.UI.getColorizedEntityName(target) + " for one turn");
				}
			}
		}

		return success;
	}

});
