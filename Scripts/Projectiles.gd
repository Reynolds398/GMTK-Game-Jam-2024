extends RigidBody2D

var parent = null  # Parent object reference
var start_pos = null  # Variable to keep track of starting pos
var damage = 0  # How much damage it should deal to enemies
var face_right = false  # Is the weapon facing right or not
var shoot_force = 0.0  # Shoot force
var new_size = Vector2(1,1)  # Variable to hold new size

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	start_pos = parent.position

func _integrate_forces(state):
	scale = new_size

# Function to shoot the projectile in the direction with the force applied
func shoot_projectile(direction, force):
	apply_impulse(direction.normalized() * force)

# Function to set damage
func set_damage(amount):
	damage = amount

# Function to set face direction
func set_face_right(right):
	face_right = right

# Function to set shoot force
func set_shoot_force(force):
	shoot_force = force

# Function to increase sprite size
func increase_size(size):
	new_size = size
