extends CharacterBody2D

@export var HEALTH = 20  # Health of enemy
@export var SPEED = 30  # Speed of enemy
@export var DAMAGE = 20  # Damage the enemy deals to tree
@export var RIGHT = true  # Boolean to know if the enemy is facing right or not
@export var BELOW = true  # Boolean to know if the enemy is below the end point or not
@export var GOLD_VALUE = 0  # How much gold it should give on death
@export var ANGLE = 45.0  # Angle to shoot the projectile at
@export var GUN_DAMAGE = DAMAGE  # Projectile damage
@export var SHOOT_FORCE = 800.0  # Projectile force
@export var RANGE = false  # Boolean to know whether unit is range or not

@onready var animated_sprite = $AnimatedSprite2D  # Animated sprite object
@onready var attack_timer = $AttackTimer  # Timer object
var parent = null  # Parent object
var main_scene = null  # Main scene object

var start_pos = Vector2.ZERO  # Starting position of enemy
var end_pos = Vector2.ZERO  # End position of enemy
var reach_end_x = false  # To know if enemy reached the end point at the x-axis
var reach_end_y = false  # To know if enemy reached the end point at the y-axis

var current_health = HEALTH  # The current health the enemy have

func _ready():
	parent = get_parent()
	main_scene = parent.get_parent()
	animated_sprite.play("walk")
	
	# Flip it by x-axis if facing left
	if not RIGHT:
		scale.x = -scale.x

func _process(delta):
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
			move_local_x(delta * -SPEED)
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
		if attack_timer.is_stopped():
			# If melee, deal damage immediately
			if not RANGE:
				deal_damage() # Attack immediately before starting cooldown
			attack_timer.start()
	
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
func take_damage(amount):
	current_health -= amount
	
	# Destroy enemy if it has no more health
	if current_health <= 0:
		delete()

# Function to deal damage to tree
func deal_damage():
	main_scene.get_node("GameUI").decrease_health(DAMAGE)

# Function to delete the enemy
func delete():
	main_scene.get_node("GameUI").add_currency(GOLD_VALUE)
	queue_free()

## Function to shoot projectile
#func shoot_projectile(bullet):
#	var projectile = bullet.instantiate()
#	add_child(projectile)
#	projectile.shoot(ANGLE)

# Function to deal with getting hit by projectile
func _on_area_2d_area_entered(area):
	var area_parent = area.get_parent()
	# Replace with function body.
	if area_parent.is_in_group("Projectile"):
		area_parent.queue_free()  # Destroy the projectile
		take_damage(area_parent.damage)  # Deal damage to the enemy
