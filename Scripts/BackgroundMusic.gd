extends AudioStreamPlayer2D

# Loop infinitely
func _on_finished():
	play()
