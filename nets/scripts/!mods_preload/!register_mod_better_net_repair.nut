::ModBetterNetRepair <- {
	ID = "mod_better_net_repair",
	Name = "Better Net Repair Perk",
	Version = "1.0.0",
};

::ModBetterNetRepair.HooksMod <- ::Hooks.register(::ModBetterNetRepair.ID, ::ModBetterNetRepair.Version, ::ModBetterNetRepair.Name);
::ModBetterNetRepair.HooksMod.require("mod_msu >= 1.2.6", "mod_legends");
::ModBetterNetRepair.HooksMod.queue(">mod_msu", "<mod_legends", function()
{
	// define mod class of this mod
	::ModBetterNetRepair.Mod <- ::MSU.Class.Mod(::ModBetterNetRepair.ID, ::ModBetterNetRepair.Version, ::ModBetterNetRepair.Name);

	// load queued files
	::include(::ModBetterNetRepair.ID + "/load.nut");
});