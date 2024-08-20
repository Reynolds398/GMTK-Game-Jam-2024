extends "res://Scripts/weapons.gd"

var boulder_object = null  # Boulder bullet object (with preload)
var boulder = null  # Instatiated boulder

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	#enable_shooting()
	boulder_object = preload("res://Scenes/Weapons/Projectile/boulder.tscn")
	parent.connect("increase_b_size", _on_increase_b_size)
	parent.connect("increase_b_reload", _on_increase_b_reload)

func _on_shoot_timer_timeout():
	#print("timer time out")
	boulder = boulder_object.instantiate()
	parent.add_child(boulder)
	boulder.position = position
	boulder.set_damage(GUN_DAMAGE)
	boulder.set_face_right(RIGHT)
	boulder.set_shoot_force(SHOOT_FORCE)
	boulder.increase_size(size)
	boulder.shoot(Vector2(SHOOT_FORCE, 0))

# Function to increase projectile size
func _on_increase_b_size(b_size):
	size = b_size

# Function to increase fire rate
func _on_increase_b_reload(cooldown):
	gun_timer.wait_time = cooldown
