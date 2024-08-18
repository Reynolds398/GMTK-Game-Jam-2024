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
	if get_parent().RIGHT:
		shoot_projectile(Vector2.RIGHT, parent.SHOOT_FORCE)
	else: # Shoot left if facing left
		shoot_projectile(Vector2.LEFT, parent.SHOOT_FORCE)

func _on_body_entered(body):
	if body.is_in_group("Wall"):
		print("I'm free!")
		queue_free()
