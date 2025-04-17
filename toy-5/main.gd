extends Node2D

var down = false
var down2 = false
var down3 = false
var down4 = false
var down5 = false

func _process(delta: float) -> void:
	if down== true and down2== true and down3== true and down4== true and down5== true:
		$ColorRect2.show()
		$ColorRect4.show()


func _on_player_dead() -> void:
	$background.stop()
	$gameover.play(0)
	$Timer.start()
	$ColorRect.show()
	$ColorRect4.show()


func _on_timer_timeout() -> void:
	$gameover.play(0)
	$Timer.start()


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


@onready var enemy = preload("res://Enemy.tscn")
var enload = 1
func _on_spawner_timeout() -> void:
	if enload < 20:
		var ene = enemy.instantiate()
		position.x = randi_range(-500,700)
		position.y = randi_range(500,-700)
		ene.position = position
		get_node("Enemy").add_child(ene)
		enload += 1
	if enload == 20:
		$Timer.stop()


func _on_enemy_slay() -> void:
	down = true
	print('1')

func _on_nemy_slay_2() -> void:
	down2 = true
	print('1')

func _on_nemy_slay_3() -> void:
	down3 = true
	print('1')

func _on_nemy_slay_4() -> void:
	down4 = true
	print('1')

func _on_nemy_slay_5() -> void:
	down5 = true
	print('1')
