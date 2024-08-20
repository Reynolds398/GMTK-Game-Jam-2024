extends "res://Scripts/weapons.gd"

var acorn_bullet = null  # Acorn bullet object (with preload)
var bullet = null  # Instatiated acorn bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	acorn_bullet = preload("res://Scenes/Weapons/Projectile/acorn_bullet.tscn")
	parent.connect("increase_p_dmg", _on_increase_p_dmg)

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_shoot_timer_timeout():
	#print("timer time out")
	bullet = acorn_bullet.instantiate()
	parent.add_child(bullet)
	bullet.position = position
	bullet.set_damage(GUN_DAMAGE)
	bullet.set_face_right(RIGHT)
	bullet.set_shoot_force(SHOOT_FORCE)
	bullet.shoot()

func _on_increase_p_dmg(dmg):
	GUN_DAMAGE = dmg
