this.reinforced_net_blueprint_meat <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.reinforced_net_blueprint_meat";
		this.m.Type = this.Const.Items.ItemType.Weapon;
		this.m.PreviewCraftable = this.new("scripts/items/tools/reinforced_throwing_net");
		this.m.Cost = 80;
		local ingredients = [
			{
				Script = "scripts/items/supplies/legend_fresh_meat_item",
				Num = 4
			},
			{
				Script = "scripts/items/misc/spider_silk_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/tools/reinforced_throwing_net"));
	}

});