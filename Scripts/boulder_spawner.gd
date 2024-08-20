extends "res://Scripts/weapons.gd"

var boulder_object = null  # Boulder bullet object (with preload)
var boulder = null  # Instatiated boulder

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	enable_shooting()
	boulder_object = preload("res://Scenes/Weapons/Projectile/boulder.tscn")

func _on_shoot_timer_timeout():
	#print("timer time out")
	boulder = boulder_object.instantiate()
	parent.add_child(boulder)
	boulder.position = position
	boulder.set_damage(GUN_DAMAGE)
	boulder.set_face_right(RIGHT)
	boulder.set_shoot_force(SHOOT_FORCE)
	boulder.shoot(Vector2(SHOOT_FORCE, 0))
