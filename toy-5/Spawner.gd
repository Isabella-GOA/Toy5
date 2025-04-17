extends Node2D

@onready var enemy = preload("res://Enemy.tscn")
var count = 1


func _on_timer_timeout() -> void:
	if count < 20:
		var ene = enemy.instantiate()
		ene.position = position
		get_parent().get_node("Enemy").add_child(ene)
		count += 1
	if count == 20:
		$Timer.stop()
