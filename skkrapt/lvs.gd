extends Control




func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenees/2d_game.tscn")


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenees/game_2.tscn")



func _on_texture_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenees/game_3.tscn")



func _on_texture_button_4_pressed() -> void:
	pass # Replace with function body.


func _on_texture_button_5_pressed() -> void:
	pass # Replace with function body.


func _on_texture_button_6_pressed() -> void:
	pass # Replace with function body.



func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://scenees/mnue.tscn")
