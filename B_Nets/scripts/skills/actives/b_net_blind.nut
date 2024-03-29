this.b_net_blind <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.b_net_blind";
		this.m.Name = "Distract";
		this.m.Description = "Use your net to distract the enemy by raking it against their eyes. Reduces inititive and damage output of the target by 35% for one turn. Can only be used once per battle.";
		this.m.Icon = "skills/active_215.png";
		this.m.IconDisabled = "skills/active_215_sw.png";
		this.m.Overlay = "active_215";
		this.m.SoundOnUse = [
			"sounds/combat/throw_net_01.wav",
			"sounds/combat/throw_net_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsWeaponSkill = true;
		this.m.IsVisibleTileNeeded = true;
		this.m.IsUsingHitchance = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 5;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 1;
	}

	function isUsable()
	{
		if (this.getContainer().hasSkill("effects.legend_threw_sand_effect"))
		{
			return false;
		}

		return this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (this.m.Container.getActor().isAlliedWith(_targetTile.getEntity()))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		_user.getSkills().add(this.new("scripts/skills/effects/legend_threw_sand_effect"));

		if (_targetTile.getEntity().isAlliedWithPlayer())
		{
			local effect = {
				Delay = 0,
				Quantity = 20,
				LifeTimeQuantity = 20,
				SpawnRate = 400,
				Brushes = [
					"sand_dust_01"
				],
				Stages = [
					{
						LifeTimeMin = 0.1,
						LifeTimeMax = 0.2,
						ColorMin = this.createColor("eeeeee00"),
						ColorMax = this.createColor("ffffff00"),
						ScaleMin = 0.5,
						ScaleMax = 0.5,
						RotationMin = 0,
						RotationMax = 359,
						VelocityMin = 60,
						VelocityMax = 100,
						DirectionMin = this.createVec(-0.7, -0.6),
						DirectionMax = this.createVec(-0.6, -0.6),
						SpawnOffsetMin = this.createVec(-35, -15),
						SpawnOffsetMax = this.createVec(35, 20)
					},
					{
						LifeTimeMin = 0.75,
						LifeTimeMax = 1.0,
						ColorMin = this.createColor("eeeeeeee"),
						ColorMax = this.createColor("ffffffff"),
						ScaleMin = 0.5,
						ScaleMax = 0.75,
						VelocityMin = 60,
						VelocityMax = 100,
						ForceMin = this.createVec(0, 0),
						ForceMax = this.createVec(0, 0)
					},
					{
						LifeTimeMin = 0.1,
						LifeTimeMax = 0.2,
						ColorMin = this.createColor("eeeeee00"),
						ColorMax = this.createColor("ffffff00"),
						ScaleMin = 0.75,
						ScaleMax = 1.0,
						VelocityMin = 0,
						VelocityMax = 0,
						ForceMin = this.createVec(0, -100),
						ForceMax = this.createVec(0, -100)
					}
				]
			};
			this.Tactical.spawnParticleEffect(false, effect.Brushes, _targetTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(30, 70));
		}
		else
		{
			local effect = {
				Delay = 0,
				Quantity = 20,
				LifeTimeQuantity = 20,
				SpawnRate = 400,
				Brushes = [
					"sand_dust_01"
				],
				Stages = [
					{
						LifeTimeMin = 0.1,
						LifeTimeMax = 0.2,
						ColorMin = this.createColor("eeeeee00"),
						ColorMax = this.createColor("ffffff00"),
						ScaleMin = 0.5,
						ScaleMax = 0.5,
						RotationMin = 0,
						RotationMax = 359,
						VelocityMin = 60,
						VelocityMax = 100,
						DirectionMin = this.createVec(0.6, -0.6),
						DirectionMax = this.createVec(0.7, -0.6),
						SpawnOffsetMin = this.createVec(-35, -15),
						SpawnOffsetMax = this.createVec(35, 20)
					},
					{
						LifeTimeMin = 1.0,
						LifeTimeMax = 1.25,
						ColorMin = this.createColor("eeeeeeee"),
						ColorMax = this.createColor("ffffffff"),
						ScaleMin = 0.5,
						ScaleMax = 0.75,
						VelocityMin = 60,
						VelocityMax = 100,
						ForceMin = this.createVec(0, 0),
						ForceMax = this.createVec(0, 0)
					},
					{
						LifeTimeMin = 0.1,
						LifeTimeMax = 0.2,
						ColorMin = this.createColor("eeeeee00"),
						ColorMax = this.createColor("ffffff00"),
						ScaleMin = 0.75,
						ScaleMax = 1.0,
						VelocityMin = 0,
						VelocityMax = 0,
						ForceMin = this.createVec(0, -100),
						ForceMax = this.createVec(0, -100)
					}
				]
			};
			this.Tactical.spawnParticleEffect(false, effect.Brushes, _targetTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(-30, 70));
		}

		local s = this.new("scripts/skills/effects/distracted_effect");
		_targetTile.getEntity().getSkills().add(s);
		this.Tactical.getShaker().shake(_targetTile.getEntity(), _user.getTile(), 4);

		if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " throws dirt in " + this.Const.UI.getColorizedEntityName(_targetTile.getEntity()) + "\'s face to distract them");
		}

		return true;
	}

});

