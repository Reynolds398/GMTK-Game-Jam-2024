extends StaticBody2D

signal enable_all_guns
signal disable_all_guns

## Called when the node enters the scene tree for the first time.
#func _ready():
#	send_enable_signal()


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Function to send enable all guns signal
func send_enable_signal():
	emit_signal("enable_all_guns")

# Function to send disable all guns signal
func send_disable_signal():
	emit_signal("disable_all_guns")
