extends "res://Scripts/Projectiles.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	super() # Call parent _ready function

	gravity_scale = 1
	
	#shoot()
	
## To safely modify position or velocity of rigidbody (to not break physics calculation)
#func _integrate_forces(state):

# Function to trigger shooting flag
func shoot(shoot_angle):
	var angle = PI * (shoot_angle/180.0)  # 45 degrees
	# Shoot right if facing right
	if get_parent().RIGHT:
		# Offset
		position += Vector2(100, -100)
		shoot_projectile(Vector2(cos(angle), sin(angle)), parent.SHOOT_FORCE)
	else: # Shoot left if facing left
		# Offset
		position += Vector2(-100, -100)
		shoot_projectile(Vector2(-cos(angle), sin(angle)), parent.SHOOT_FORCE)

func _on_area_2d_body_entered(body):
	if body.is_in_group("Wall") or body.is_in_group("Floor"):
		print("I'm free!")
		queue_free()
	
	# If hit tree, make tree take damage
	if body.is_in_group("Tree"):
		body.get_parent().take_damage(damage)
		queue_free()
