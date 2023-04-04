this.legend_net_blueprint_roots <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_net_blueprint_roots";
		this.m.Type = this.Const.Items.ItemType.Weapon;
		this.m.PreviewCraftable = this.new("scripts/items/tools/throwing_net");
		this.m.Cost = 30;
		local ingredients = [
			{
				Script = "scripts/items/supplies/roots_and_berries_item",
				Num = 3
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/tools/throwing_net"));
	}

});