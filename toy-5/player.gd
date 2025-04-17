extends CharacterBody2D

var HEALTH = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var damage = 0
signal dead
signal hit
var enemy = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		emit_signal("hit")
		#$Timer.start()
		$AnimatedSprite2D.play("attack")

	if HEALTH > 0:
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		var direction2 := Input.get_axis("ui_up", "ui_down")
		if direction2:
			velocity.y = direction2 * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
		move_and_slide()
		if velocity.x < 0:
			$AnimatedSprite2D.play("left")
		if velocity.x > 0:
			$AnimatedSprite2D.play("right")
		if velocity.y < 0:
			$AnimatedSprite2D.play("up")
		if velocity.y > 0:
			$AnimatedSprite2D.play("down")
		if velocity.x == 0 and velocity.y == 0 and enemy == false:
			$AnimatedSprite2D.play("idle")
	else:
		pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Enemy" or body.name == "2nemy" or body.name == "3nemy" or body.name == "4nemy" or body.name == "5nemy":
		damage = 10
	if HEALTH > 0:
		HEALTH -= damage
		$Label.text = "Health: %d" % HEALTH
	if HEALTH == 0:
		emit_signal("dead")
		$AnimatedSprite2D.play("dead")


func pond(body):
	if body.name == "player":
		emit_signal("dead")
		print('killme')
		HEALTH = 0
		$Label.text = "Health: %d" % HEALTH
		$AnimatedSprite2D.play("dead")


func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play("idle")
	$Timer.stop()
