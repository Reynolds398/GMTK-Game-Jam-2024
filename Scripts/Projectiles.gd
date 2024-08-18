extends RigidBody2D

@onready var collision = $CollisionShape2D
var parent = null  # Parent object reference
var start_pos = null  # Variable to keep track of starting pos
var damage = 0  # How much damage it should deal to enemies

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	start_pos = parent.position
	damage = parent.GUN_DAMAGE
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Function to shoot the projectile in the direction with the force applied
func shoot_projectile(direction, force):
	apply_impulse(direction.normalized() * force)
