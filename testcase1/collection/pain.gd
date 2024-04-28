extends CharacterBody2D

@export var bullet_node: PackedScene

#bullet maths
var theta: float = 0.0
@export_range(0,2*PI) var alpha: float = 0.0

func get_vector(angle):
	theta = angle + alpha
	return Vector2(cos(theta),sin(theta))
	
func shoot(angle):
	var bullet = bullet_node.instantiate()
	
	bullet.position = self.global_position	
	bullet.direction = get_vector(angle)
	
	get_tree().current_scene.call_deferred("add_child",bullet) 


func _on_timer_timeout():
	shoot(theta)
	 # Replace with function body.