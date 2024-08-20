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
var bould_left_1 = null
# Right side
var gun_right_1 = null
var gun_right_2 = null
var pult_right_1 = null
var pult_right_2 = null
var pult_right_3 = null
var pult_right_4 = null
var pult_right_5 = null
var pult_right_6 = null
var bould_right_1 = null
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

# Update showing the guns for stage 3
func update_stage_4():
	show_p_gun_left(false)
	show_p_gun_right(false)
	show_pult_left()
	show_pult_right()

# Update showing the guns for stage 3
func update_stage_5():
	show_p_gun_left(false)
	show_p_gun_right(false)
	show_pult_left()
	show_pult_right()
	show_bould_left()
	show_bould_right()

# Update showing the guns for stage 3
func update_stage_6():
	show_p_gun_left(false)
	show_p_gun_right(false)
	show_pult_left()
	show_pult_right()
	show_bould_left()
	show_bould_right()

# Update showing the guns for stage 3
func update_stage_7():
	show_p_gun_left(false)
	show_p_gun_right(false)
	show_pult_left()
	show_pult_right()
	show_bould_left()
	show_bould_right()

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
	
	if parent.c_left > 2:
		if pult_wall_1 == null:
			pult_wall_1 = $PultWall1
		
		pult_wall_1.enable_shooting()
	
	if parent.c_left > 3:
		if pult_left_3 == null:
			pult_left_3 = $PultLeft4
		
		pult_left_3.visible = true
		pult_left_3.enable_shooting()
	
	if parent.c_left > 4:
		if pult_left_4 == null:
			pult_left_4 = $PultLeft2
		
		pult_left_4.visible = true
		pult_left_4.enable_shooting()
	
	if parent.c_left > 5:
		if pult_left_5 == null:
			pult_left_5 = $PultLeft6
		
		pult_left_5.visible = true
		pult_left_5.enable_shooting()
		
	if parent.c_left > 6:
		if pult_left_6 == null:
			pult_left_6 = $PultLeft6
		
		pult_left_6.visible = true
		pult_left_6.enable_shooting()

# Show the catapult on the right side according to the upgrade
func show_pult_right():
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
	
	if parent.c_right > 2:
		if pult_wall_2 == null:
			pult_wall_2 = $PultWall2
		
		pult_wall_2.enable_shooting()
	
	if parent.c_right > 3:
		if pult_right_3 == null:
			pult_right_3 = $PultRight3
			
		pult_right_3.visible = true
		pult_right_3.enable_shooting()
	
	if parent.c_right > 4:
		if pult_right_4 == null:
			pult_right_4 = $PultRight4
			
		pult_right_4.visible = true
		pult_right_4.enable_shooting()
	
	if parent.c_right > 5:
		if pult_right_5 == null:
			pult_right_5 = $PultRight5
			
		pult_right_5.visible = true
		pult_right_5.enable_shooting()
		
	if parent.c_right > 6:
		if pult_right_6 == null:
			pult_right_6 = $PultRight6
			
		pult_right_6.visible = true
		pult_right_6.enable_shooting()

# Show the bould on the left side according to the upgrade
func show_bould_left():
	if parent.b_left > 0:
		if bould_left_1 == null:
			bould_left_1 = $BouldLeft
		
		bould_left_1.enable_shooting()

# Show the boulder on the right side according to the upgrade
func show_bould_right():
	if parent.b_right > 0:
		if bould_right_1 == null:
			bould_right_1 = $BouldRight
		
		bould_right_1.enable_shooting()

func hide_all():
	# Left weapons
	if gun_left_2 != null:
		gun_left_2.visible = false
	if pult_left_1 != null:
		pult_left_1.visible = false
	if pult_left_2 != null:
		pult_left_2.visible = false
	if pult_left_3 != null:
		pult_left_3.visible = false
	if pult_left_4 != null:
		pult_left_4.visible = false
	if pult_left_5 != null:
		pult_left_5.visible = false
	if pult_left_6 != null:
		pult_left_6.visible = false
	if bould_left_1 != null:
		bould_left_1.visible = false
	# Right side
	if gun_right_1 != null:
		gun_right_1.visible = false
	if gun_right_2 != null:
		gun_right_2.visible = false
	if pult_right_1 != null:
		pult_right_1.visible = false
	if pult_right_2 != null:
		pult_right_2.visible = false
	if pult_right_3 != null:
		pult_right_3.visible = false
	if pult_right_4 != null:
		pult_right_4.visible = false
	if pult_right_5 != null:
		pult_right_5.visible = false
	if pult_right_6 != null:
		pult_right_6.visible = false
	if bould_right_1 != null:
		bould_right_1.visible = false

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
