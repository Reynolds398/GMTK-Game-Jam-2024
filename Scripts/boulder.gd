extends "res://Scripts/Projectiles.gd"

var parent = null  # Parent object reference
var start_pos = null  # Variable to keep track of starting pos
var vel = Vector2.ZERO  # Variable to set the speed

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	start_pos = parent.position
	gravity_scale = 1
	
	#shoot()
	
# To safely modify position or velocity of rigidbody (to not break physics calculation)
func _integrate_forces(state):
	linear_velocity = vel

# Function to trigger shooting flag
func shoot(velocity):
	# Shoot right if facing right
	if get_parent().RIGHT:
		vel = velocity
	else: # Shoot left if facing left
		vel = velocity * Vector2(-1, 1)

func _on_body_entered(body):
	if body.is_in_group("Wall"):
		print("I'm free!")
		queue_free()
