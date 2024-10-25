extends Area2D

@onready var player: CharacterBody2D = %player
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	player.add_point()
	animation_player.play("po")
