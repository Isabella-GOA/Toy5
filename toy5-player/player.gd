extends CharacterBody2D

var HEALTH = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var damage = 0

func _physics_process(delta: float) -> void:
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
	else:
		pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "enemystandin":
		damage = 10
	if HEALTH > 0:
		HEALTH -= damage
		$Label.text = "Health: %d" % HEALTH
	if HEALTH == 0:
		print("Game Over")
		$AnimatedSprite2D.play("dead")
		$AnimatedSprite2D.rotate(PI)
