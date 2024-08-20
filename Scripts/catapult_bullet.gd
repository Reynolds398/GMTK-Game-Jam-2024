extends "res://Scripts/Projectiles.gd"

@export var right_offset = Vector2(100, -100)
@export var left_offset = Vector2(-100, -100)

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
	if face_right:
		# Offset
		position += right_offset
		shoot_projectile(Vector2(cos(angle), sin(angle)), shoot_force)
	else: # Shoot left if facing left
		# Offset
		position += left_offset
		shoot_projectile(Vector2(-cos(angle), sin(angle)), shoot_force)

func _on_area_2d_body_entered(body):
	if body.is_in_group("Wall") or body.is_in_group("Floor"):
		queue_free()
	
	# If hit tree, make tree take damage
	if body.is_in_group("Tree"):
		body.get_parent().take_damage(damage)
		queue_free()
