extends "res://Scripts/weapons.gd"

@export var angle = -60 # Variable for shooting angle

var catapult_bullet = null  # Catapult bullet object (with preload)
var bullet = null  # Instatiated catapult bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	catapult_bullet = preload("res://Scenes/Weapons/Projectile/catapult_bullet.tscn")
	parent.connect("increase_c_dmg", _on_increase_c_dmg)
	parent.connect("increase_c_size", _on_increase_c_size)
	parent.connect("increase_c_reload", _on_increase_c_reload)

func _on_shoot_timer_timeout():
	#print("timer time out")
	bullet = catapult_bullet.instantiate()
	parent.add_child(bullet)
	bullet.position = position
	bullet.set_damage(GUN_DAMAGE)
	bullet.set_face_right(RIGHT)
	bullet.set_shoot_force(SHOOT_FORCE)
	bullet.increase_size(size)
	bullet.shoot(angle)
	$AnimationPlayer.play("shoot")

# Function to increase projectile damage
func _on_increase_c_dmg(dmg):
	GUN_DAMAGE = dmg

# Function to increase projectile size
func _on_increase_c_size(c_size):
	size = c_size

# Function to increase fire rate
func _on_increase_c_reload(cooldown):
	gun_timer.wait_time = cooldown
