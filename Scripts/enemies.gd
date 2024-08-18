extends CharacterBody2D

@export var HEALTH = 20  # Health of enemy
@export var SPEED = 30  # Speed of enemy
@export var DAMAGE = 20  # Damage the enemy deals to tree
@export var RIGHT = true  # Boolean to know if the enemy is facing right or not
@export var BELOW = true  # Boolean to know if the enemy is below the end point or not

@onready var animated_sprite = $AnimatedSprite2D  # Animated sprite object
var parent = null  # Parent object

var start_pos = Vector2.ZERO  # Starting position of enemy
var end_pos = Vector2.ZERO  # End position of enemy
var reach_end_x = false  # To know if enemy reached the end point at the x-axis
var reach_end_y = false  # To know if enemy reached the end point at the y-axis

func _ready():
	parent = get_parent()
	animated_sprite.play("walk")
	#start_pos = Vector2(27, 610)
	#end_pos = Vector2(502, 610)

func _process(delta):
	print()
#	print(reach_end_x)
#	print(reach_end_y)
	
	# Move towards end position in the x-axis if not reached
	if RIGHT:
		# (Assuming spawn is to the left of end position)
		if position.x < end_pos.x:
			move_local_x(delta * -SPEED)
		else:
			reach_end_x = true
	else:
		# (Assuming spawn is to the right of end position)
		if position.x > end_pos.x:
			move_local_x(delta * SPEED)
		else:
			reach_end_x = true
	
	# Move towards end position in the y-axis if not reached
	if BELOW:
		# (Assuming spawn is below the end position)
		if position.y > end_pos.y:
			move_local_y(delta * -SPEED)
		else:
			reach_end_y = true
	else:
		# (Assuming spawn is above the end position)
		if position.y < end_pos.y:
			move_local_y(delta * SPEED)
		else:
			reach_end_y = true
	
	# Will only pass if both y and x position is reached
	if reach_end_x and reach_end_y:
		animated_sprite.play("attack")
	
#	parent.progress = parent.progress + speed*delta
#
#	# If reach end of path
#	if parent.progress_ratio == 1:
#		speed = 0
#		animated_sprite.play("attack")

# Initialize starting and end position. Takes in Vector2 variables for both
func init_start_end_pos(start, end):
	# Initialize both variable
	start_pos = start
	end_pos = end
	
	# Move enemy to starting pos
	position = start_pos

# Function to take damage from attacks
func take_damage():
	pass

# Function to deal damage to tree
func deal_damage():
	pass

# Function to delete the enemy
func delete():
	queue_free()
