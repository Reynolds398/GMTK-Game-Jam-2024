extends "res://Scripts/Projectiles.gd"

var parent = null  # Parent object reference
var start_pos = null  # Variable to keep track of starting pos
var shooting = false  # Boolean to let game know that it is shooting

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	start_pos = parent.position
	gravity_scale = 0
	
	shoot()
	
## To safely modify position or velocity of rigidbody (to not break physics calculation)
#func _integrate_forces(state):

# Function to trigger shooting flag
func shoot():
	# Shoot right if facing right
	if get_parent().RIGHT:
		shoot_projectile(Vector2.RIGHT, parent.SHOOT_FORCE)
	else: # Shoot left if facing left
		shoot_projectile(Vector2.LEFT, parent.SHOOT_FORCE)
