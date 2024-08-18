extends CharacterBody2D

@export var health = 20
@export var speed = 30
@export var damage = 20

@onready var animated_sprite = $AnimatedSprite2D
var parent = null

func _ready():
	parent = get_parent()
	animated_sprite.play("walk")

func _process(delta):
	parent.progress = parent.progress + speed*delta
	
	# If reach end of path
	if parent.progress_ratio == 1:
		speed = 0
		animated_sprite.play("attack")
