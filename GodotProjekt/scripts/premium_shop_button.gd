extends TextureButton


func _on_pressed():
	$"../PremiumShop".visible = !$"../PremiumShop".visible
