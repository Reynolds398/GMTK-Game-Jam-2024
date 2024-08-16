extends RigidBody2D

@onready var collision = $CollisionShape2D

## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Dealing with collision (don't delete and just reuse the spawned projectile)
# Freeze, disable collsion, and make it invisible
func _on_body_entered(body): 
	freeze = true
	collision.disabled = true
	visible = false

# Function to shoot the projectile in the direction with the force applied
func shoot_projectile(direction, force):
	apply_impulse(direction.normalized() * force)

# Function to shoot the projectile in a straight line (not affected by gravity)
func shoot_linear(direction, force):
	gravity_scale = 0
	apply_force(force * direction.normalized())
