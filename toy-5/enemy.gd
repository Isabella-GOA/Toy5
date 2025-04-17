extends CharacterBody2D

var speed = 400
var player_chase = false
var player = null
var death = false
var armor = true
signal slay

func _physics_process(delta):
	if death:
		player_chase = false
		$AnimatedSprite2D.play("new_animation")
	if !death:
		if player_chase:
			position += (player.position - position) / speed
			$AnimatedSprite2D.play("Walk")
			if (player.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.play("Idle")

func _on_zone_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_zone_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false

var damage = 20
var Health = 100
func _on_player_hit() -> void:
	if !armor:
		if Health > 0:
			Health -= damage
		if Health == 0:
			print('bleh')
			emit_signal("slay")
			queue_free()
			death = true


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.name == 'player':
		armor = false

func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body.name == 'player':
		armor = true
