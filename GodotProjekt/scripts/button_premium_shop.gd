extends TextureButton

func _on_pressed():
	var premium_shop: Control = $"../PremiumShop";
	premium_shop.visible = !premium_shop.visible;
