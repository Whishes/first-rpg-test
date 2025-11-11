extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
	var collision_child: CollisionShape2D = get_child(0)
	var level_to_move = collision_child.name
	
	
	print(level_to_move)
