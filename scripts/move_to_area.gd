extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
	var collision_child: CollisionShape2D = get_child(0)
	var level_to_move = collision_child.name
	var file_path_new_level = "res://scenes/levels/%s.tscn" % level_to_move
	
	print(level_to_move)
	get_tree().call_deferred("change_scene_to_file", file_path_new_level)
	#call_deferred("queue_free")
