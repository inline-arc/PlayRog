extends Node2D

#preload bullet
const bullet_scene: PackedScene = preload('res://bullet.tscn')


func _on_ninjaboi_shoot(pos, facing_right):
	var bullet = bullet_scene.instantiate()
	var direction = 1 if facing_right else -1
	$Bullets.add_child(bullet)
	bullet.position = pos
	bullet.direction = direction
	
	
	# Replace with function body.
