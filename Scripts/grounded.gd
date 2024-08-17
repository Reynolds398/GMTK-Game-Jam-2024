extends CharacterBody2D

@export var speed = 30
@export var damage = 10
@export var start = 0.0

func _ready():
	get_node("AnimatedSprite2D").play("idle")
	get_parent().set_progress_ratio(start)

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		speed = 0
		get_node("AnimatedSprite2D").play("attack")
