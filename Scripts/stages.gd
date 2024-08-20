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

# Upgrade tracker for each upgrades
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
var p_reload = 0
var c_reload = 0

func update_stage_1():
	if parent.p_left > 0:
		gun_left_1.visible = true
		gun_left_1.enable_shooting()

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
