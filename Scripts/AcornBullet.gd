extends "res://Scripts/Projectiles.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	super() # Call parent _ready function
	gravity_scale = 0
	
	#shoot()

## To safely modify position or velocity of rigidbody (to not break physics calculation)
#func _integrate_forces(state):

# Function to trigger shooting flag
func shoot():
	# Shoot right if facing right
	if face_right:
		shoot_projectile(Vector2.RIGHT, shoot_force)
	else: # Shoot left if facing left
		shoot_projectile(Vector2.LEFT, shoot_force)

func _on_area_2d_body_entered(body):
	if body.is_in_group("Wall"):
		queue_free()
	
	# If hit tree, make tree take damage
	if body.is_in_group("Tree"):
		body.get_parent().take_damage(damage)
		queue_free()
