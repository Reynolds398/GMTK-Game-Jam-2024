extends Node2D

@export var GUN_DAMAGE = 20  # How much damage the bullet should deal
@export var RIGHT = true  # Variable to know if the acorn gun is facing to the right
@export var SHOOT_FORCE = 100.0  # Shooting force
@export var SHOOT_TIMER = 1.0  # Cooldown timer for next shot

@onready var gun_timer = $ShootTimer  # Shoot Timer object
@onready var parent = get_parent()

func _ready():
	gun_timer.wait_time = SHOOT_TIMER
	parent.connect("enable_all_guns", _on_enable_signal)
	parent.connect("disable_all_guns", _on_disable_signal)

# Function to allow shooting
func enable_shooting():
	gun_timer.start()

# Function to disable shooting
func disable_shooting():
	gun_timer.stop()

# Function to enable shooting when received signal
func _on_enable_signal():
	enable_shooting()

# Function to disable shooting when received signal
func _on_disable_signal():
	disable_shooting()
