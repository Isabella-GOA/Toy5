extends CharacterBody2D

var HEALTH = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var damage = 0
signal dead
signal hit
<<<<<<< Updated upstream

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
			emit_signal("hit")
			print('hit')
=======
var enemy = false

func _physics_process(delta: float) -> void:
	if enemy == true:
		if Input.is_action_just_pressed("attack"):
				emit_signal("hit")
				$Timer.start()
				$AnimatedSprite2D.play("attack")
				$AnimatedSprite2D2.hide()
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
		if velocity.x == 0 and velocity.y == 0:
=======
		if velocity.x == 0 and velocity.y == 0 and enemy == false:
>>>>>>> Stashed changes
			$AnimatedSprite2D.play("idle")
	else:
		pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "enemystandin":
		damage = 10
	if HEALTH > 0:
		HEALTH -= damage
		$Label.text = "Health: %d" % HEALTH
	if HEALTH == 0:
		emit_signal("dead")
<<<<<<< Updated upstream
		print("Game Over")
=======
>>>>>>> Stashed changes
		$AnimatedSprite2D.play("dead")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
<<<<<<< Updated upstream
	if body.name != "enemystandin":
		print(body.name)
	if body.name == "enemystandin":
		if Input.is_action_just_pressed("attack"):
			emit_signal("hit")
			print('hit')
			$Timer.start()
			$AnimatedSprite2D.play("attack")
=======
	if body.name == "enemystandin":
		enemy = true
		$AnimatedSprite2D2.show()
>>>>>>> Stashed changes


func pond(body):
	if body.name == "player":
		emit_signal("dead")
<<<<<<< Updated upstream
		print("Game Over")
=======
>>>>>>> Stashed changes
		HEALTH = 0
		$Label.text = "Health: %d" % HEALTH
		$AnimatedSprite2D.play("dead")


func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play("idle")
<<<<<<< Updated upstream
	print('done')
=======
	$Timer.stop()
	if enemy == true:
		$AnimatedSprite2D2.show()

func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body.name == "enemystandin":
		enemy = false
		$AnimatedSprite2D2.hide()
>>>>>>> Stashed changes
