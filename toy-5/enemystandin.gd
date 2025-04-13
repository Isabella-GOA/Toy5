extends CharacterBody2D

var damage = 0

func _physics_process(delta: float) -> void:
	pass

func _on_player_hit() -> void:
	damage += 10
	$Label.text = "Damage Dealt: %d" % damage
