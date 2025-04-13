extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_dead() -> void:
	$background.stop()
	$gameover.play(0)
	$Timer.start()


func _on_timer_timeout() -> void:
	$gameover.play(0)
	$Timer.start()
