extends CanvasLayer

var can_toggle_pause = false  # Whether you can pause the game or not

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("game_pause"):
		if not get_tree().paused:
			pause()
		else:
			resume()
	
func pause():
	if can_toggle_pause:
		get_tree().set_deferred("paused", true)

func resume():
	if can_toggle_pause:
		get_tree().set_deferred("paused", false)
