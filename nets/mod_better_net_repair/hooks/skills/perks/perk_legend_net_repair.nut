::ModBetterNetRepair.HooksMod.hook("scripts/skills/perks/perk_legend_net_repair", function(q) {
	q.onNewDay <- function()
	{
		// has any untreated injury or not
		if (this.getContainer().getSkillsByFunction(function( _skill ) {
			return _skill.isType(::Const.SkillType.Injury) && !_skill.isType(::Const.SkillType.PermanentInjury) && !_skill.isTreated();
		}).len() > 0)
			return;

		local find = ::World.Assets.getStash().removeByID("tool.legend_broken_throwing_net");

		// find no broken net to fix
		if (find == null)
			return;

		// successfully repaired it lol
		::World.Assets.getStash().add(::new("scripts/items/tools/throwing_net"));
	}
})