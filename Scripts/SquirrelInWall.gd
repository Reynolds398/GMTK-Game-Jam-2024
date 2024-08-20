extends Node2D

@onready var anim_player = $AnimationPlayer

# Function to start playing the animation
func play_anim():
	anim_player.play("show") 

# Function to stop playing the animation
func stop_anim():
	anim_player.stop()

# Loop infinitely
func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"show":
			await get_tree().create_timer(3.0).timeout
			anim_player.play("hide")
		"hide":
			await get_tree().create_timer(3.0).timeout
			anim_player.play("show")
