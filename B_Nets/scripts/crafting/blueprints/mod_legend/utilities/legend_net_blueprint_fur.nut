this.legend_net_blueprint_fur <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_net_blueprint_fur";
		this.m.Type = this.Const.Items.ItemType.Weapon;
		this.m.PreviewCraftable = this.new("scripts/items/tools/throwing_net");
		this.m.Cost = 90;
		local ingredients = [
			{
				Script = "scripts/items/trade/furs_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/tools/throwing_net"));
		_stash.add(this.new("scripts/items/tools/throwing_net"));
		_stash.add(this.new("scripts/items/tools/throwing_net"));
	}

});