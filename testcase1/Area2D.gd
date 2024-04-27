extends Area2D


var speed = 200.0
var direction = Vector2.RIGHT

func _physics_process(delta):
	position += direction * speed * delta
	


func screen_exited():
		queue_free()# Replace with function body.
