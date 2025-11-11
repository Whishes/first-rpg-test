extends CharacterBody2D

var speed = 100
var direction = Vector2.ZERO
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	#var level_limits = get_tree().root.limit
	pass
	
func _process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Stops movement if not pressing any input above
	if input_dir == Vector2.ZERO: direction = Vector2.ZERO
	
	if (Input.is_action_pressed("ui_left")):
		# this bit makes it only left, right, up, down directions
		direction = Vector2(input_dir.x, 0).normalized()
		animated_sprite.play("idle_left")
		
	if (Input.is_action_pressed("ui_right")):
		direction = Vector2(input_dir.x, 0).normalized()
		animated_sprite.play("idle_right")
	
	if (Input.is_action_pressed("ui_down")):
		direction = Vector2(0, input_dir.y).normalized()
		animated_sprite.play("idle_down")
	
	if (Input.is_action_pressed("ui_up")):
		direction = Vector2(0, input_dir.y).normalized()
		animated_sprite.play("idle_up")
	
	velocity = direction * speed
	move_and_slide()
