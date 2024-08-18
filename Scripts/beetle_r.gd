extends "res://Scripts/enemies.gd"

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
