extends "res://Scripts/weapons.gd"

@onready var gun_timer = $ShootTimer  # Shoot Timer object

var boulder_object = null  # Catapult bullet object (with preload)
var boulder = null  # Instatiated acorn bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	gun_timer.wait_time = SHOOT_TIMER
	gun_timer.start()
	boulder_object = preload("res://Scenes/boulder.tscn")

func _on_shoot_timer_timeout():
	#print("timer time out")
	boulder = boulder_object.instantiate()
	add_child(boulder)
	boulder.shoot(Vector2(SHOOT_FORCE, 0))
