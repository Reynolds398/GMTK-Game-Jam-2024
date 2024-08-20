extends StaticBody2D

signal enable_all_guns
signal disable_all_guns
signal increase_p_dmg(dmg)
signal increase_p_size(size)
signal increase_p_reload(cooldown)
signal increase_c_dmg(dmg)
signal increase_c_size(size)
signal increase_c_reload(cooldown)
signal increase_b_size(size)
signal increase_b_reload(cooldown)

# All weapons objects
# Left side
@onready var gun_left_1 = $GunLeft1
var gun_left_2 = null
var pult_left_1 = null
var pult_left_2 = null
var pult_left_3 = null
var pult_left_4 = null
var pult_left_5 = null
var pult_left_6 = null
# Right side
var gun_right_1 = null
var gun_right_2 = null
var pult_right_1 = null
var pult_right_2 = null
var pult_right_3 = null
var pult_right_4 = null
var pult_right_5 = null
var pult_right_6 = null
# Center
var pult_wall_1 = null
var pult_wall_2 = null

var parent = null  # Parent object

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Upgrade tracker for each upgrades (For reference so should delete after)
# DELETE THESE AFTER 
var p_left = 1
var c_left = 0
var b_left = 0
var p_right = 0
var c_right = 0
var b_right = 0
var p_dmg = 0
var c_dmg = 0
var p_size = 0
var c_size = 0
var b_size = 0
var p_reload = 0
var c_reload = 0
var b_reload = 0

# Update showing the guns for stage 1
func update_stage_1():
	show_p_gun_left()

# Update showing the guns for stage 2
func update_stage_2():
	show_p_gun_left()
	show_p_gun_right()

# Update showing the guns for stage 3
func update_stage_3():
	show_p_gun_left(false)
	show_p_gun_right(false)

# Show the peashooter gun on the left side according to the upgrade
func show_p_gun_left(show = true):
	if parent.p_left > 0:
		if show:
			gun_left_1.visible = true
		else:
			gun_left_1.visible = false
		gun_left_1.enable_shooting()
		
	if parent.p_left > 1:
		if gun_left_2 == null:
			gun_left_2 = $GunLeft2
		
		gun_left_2.enable_shooting()

# Show the peashooter gun on the right side according to the upgrade
func show_p_gun_right(show = true):
	if parent.p_right > 0:
		if gun_right_1 == null:
			gun_right_1 = $GunRight1
		
		if show:
			gun_right_1.visible = true
		else:
			gun_right_1.visible = false
		
		gun_right_1.enable_shooting()
		
	if parent.p_right > 1:
		if gun_right_2 == null:
			gun_right_2 = $GunRight2
			
		gun_right_2.enable_shooting()

# Show the catapult on the left side according to the upgrade
func show_pult_left():
	print("c_left", c_left)
	if parent.c_left > 0:
		if pult_left_1 == null:
			pult_left_1 = $PultLeft1
		
		pult_left_1.visible = true
		pult_left_1.enable_shooting()
		
	if parent.c_left > 1:
		if pult_left_2 == null:
			pult_left_2 = $PultLeft2
		
		pult_left_2.visible = true
		pult_left_2.enable_shooting()

# Show the catapult on the right side according to the upgrade
func show_pult_right():
	print("c_right", c_right)
	if parent.c_right > 0:
		if pult_right_1 == null:
			pult_right_1 = $PultRight1
		
		pult_right_1.visible = true
		pult_right_1.enable_shooting()
		
	if parent.c_right > 1:
		if pult_right_2 == null:
			pult_right_2 = $PultRight2
			
		pult_right_2.visible = true
		pult_right_2.enable_shooting()
	

# Function to initialize all weapon object for stage 7
func init_stage_7():
	pass

# Function to send enable all guns signal
func send_enable_signal():
	emit_signal("enable_all_guns")

# Function to send disable all guns signal
func send_disable_signal():
	emit_signal("disable_all_guns")

# Function to send signal to increase damage output of all p guns
func upgrade_p_dmg(dmg):
	emit_signal("increase_p_dmg", dmg)

# Function to send signal to increase size of all p guns
func upgrade_p_size(size):
	emit_signal("increase_p_size", size)

# Function to send signal to increase fire rate of p guns
func upgrade_p_reload(cooldown):
	emit_signal("increase_p_reload", cooldown)

# Function to send signal to increase damage output of all catapults
func upgrade_c_dmg(dmg):
	emit_signal("increase_c_dmg", dmg)

# Function to send signal to increase catapult size
func upgrade_c_size(size):
	emit_signal("increase_c_size", size)

# Function to send signal to increase fire rate of catapult
func upgrade_c_reload(cooldown):
	emit_signal("increase_c_reload", cooldown)

# Function to send signal to increase boulder size
func upgrade_b_size(size):
	emit_signal("increase_b_size", size)

# Function to send signal to increase fire rate of boulder
func upgrade_b_reload(cooldown):
	emit_signal("increase_b_reload", cooldown)
