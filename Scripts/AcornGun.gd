extends Node2D

@export var RIGHT = true
@export var SHOOT_FORCE = 100.0
@export var SHOOT_TIMER = 1.0

@onready var gun_timer = $ShootTimer
var acorn_bullet = null
var bullet = null

# Called when the node enters the scene tree for the first time.
func _ready():
	gun_timer.wait_time = SHOOT_TIMER
	gun_timer.start()
	acorn_bullet = preload("res://Scenes/acorn_bullet.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_shoot_timer_timeout():
	#print("timer time out")
	bullet = acorn_bullet.instantiate()
	add_child(bullet)
	bullet.shoot()
