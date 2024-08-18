extends "res://Scripts/weapons.gd"

@onready var gun_timer = $ShootTimer  # Shoot Timer object

var acorn_bullet = null  # Acorn bullet object (with preload)
var bullet = null  # Instatiated acorn bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	gun_timer.wait_time = SHOOT_TIMER
	gun_timer.start()
	acorn_bullet = preload("res://Scenes/Weapons/Projectile/acorn_bullet.tscn")

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_shoot_timer_timeout():
	#print("timer time out")
	bullet = acorn_bullet.instantiate()
	add_child(bullet)
	bullet.shoot()
