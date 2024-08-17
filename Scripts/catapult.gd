extends "res://Scripts/weapons.gd"

@export var angle = -60 # Variable for shooting angle

@onready var gun_timer = $ShootTimer  # Shoot Timer object

var catapult_bullet = null  # Catapult bullet object (with preload)
var bullet = null  # Instatiated acorn bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	gun_timer.wait_time = SHOOT_TIMER
	gun_timer.start()
	catapult_bullet = preload("res://Scenes/catapult_bullet.tscn")


func _on_shoot_timer_timeout():
	#print("timer time out")
	bullet = catapult_bullet.instantiate()
	add_child(bullet)
	bullet.shoot(angle)
