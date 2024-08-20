extends "res://Scripts/enemies.gd"

# Preload the bullet
var bullet = preload("res://Scenes/Weapons/Projectile/catapult_bullet_enemy.tscn")
var projectile = null  # Projectile object

#@export var health = 30
#@export var speed = 30
#@export var damage = 10
#
#func _ready():
#	get_node("AnimatedSprite2D").play("walk")
#
#func _process(delta):
#	get_parent().set_progress(get_parent().get_progress() + speed*delta)
#	if get_parent().get_progress_ratio() == 1:
#		speed = 0
#		get_node("AnimatedSprite2D").play("attack")

# When timer runs out, shoot projectile
func _on_attack_timer_timeout():
	projectile = bullet.instantiate()
	add_child(projectile)
	projectile.set_damage(DAMAGE)
	projectile.shoot(ANGLE)
