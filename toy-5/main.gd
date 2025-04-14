extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
<<<<<<< Updated upstream
	pass # Replace with function body.
=======
	pass
>>>>>>> Stashed changes


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_dead() -> void:
	$background.stop()
	$gameover.play(0)
	$Timer.start()
<<<<<<< Updated upstream
=======
	$ColorRect.show()
	$ColorRect4.show()
>>>>>>> Stashed changes


func _on_timer_timeout() -> void:
	$gameover.play(0)
	$Timer.start()
<<<<<<< Updated upstream
=======


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_start_pressed() -> void:
	$ColorRect3.hide()

func _on_button_2_pressed() -> void:
	$ColorRect3/menu.hide()
	$ColorRect3/credits.show()
	$ColorRect3/return.show()

func _on_return_pressed() -> void:
	$ColorRect3/menu.show()
	$ColorRect3/credits.hide()
	$ColorRect3/return.hide()
>>>>>>> Stashed changes
