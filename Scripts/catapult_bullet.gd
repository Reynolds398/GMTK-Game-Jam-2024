extends "res://Scripts/Projectiles.gd"

var parent = null  # Parent object reference
var start_pos = null  # Variable to keep track of starting pos

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	start_pos = parent.position
	gravity_scale = 1
	
	#shoot()
	
## To safely modify position or velocity of rigidbody (to not break physics calculation)
#func _integrate_forces(state):

# Function to trigger shooting flag
func shoot(shoot_angle):
	var angle = PI * (shoot_angle/180.0)  # 45 degrees
	# Shoot right if facing right
	if get_parent().RIGHT:
		shoot_projectile(Vector2(cos(angle), sin(angle)), parent.SHOOT_FORCE)
	else: # Shoot left if facing left
		shoot_projectile(Vector2(-cos(angle), sin(angle)), parent.SHOOT_FORCE)
