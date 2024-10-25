extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://lvs.tscn")






func _on_exit_button_pressed() -> void:
	get_tree().quit()
