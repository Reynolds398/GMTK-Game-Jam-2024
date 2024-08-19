extends Node2D

@export var GUN_DAMAGE = 20  # How much damage the bullet should deal
@export var RIGHT = true  # Variable to know if the acorn gun is facing to the right
@export var SHOOT_FORCE = 100.0  # Shooting force
@export var SHOOT_TIMER = 1.0  # Cooldown timer for next shot

@onready var gun_timer = $ShootTimer  # Shoot Timer object

func _ready():
	gun_timer.wait_time = SHOOT_TIMER

func enable_shooting():
	gun_timer.start()

func disable_shooting():
	gun_timer.stop()
