::ModBetterNetRepair.HooksMod.hook("scripts/crafting/blueprints/mod_legend/utilities/legend_net_restored_blueprint", function(q) {
	q.isValid <- function()
	{
		return false;
	}
})