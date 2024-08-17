extends PathFollow2D

@export var start = 0.0

func _ready():
	set_progress_ratio(start)
