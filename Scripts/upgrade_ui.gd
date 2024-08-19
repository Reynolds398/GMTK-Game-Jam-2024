extends CanvasLayer

# Damage Upgrade Buttons
@onready var p_dmg_button = $PeaDamageButton
@onready var c_dmg_button = $CataDamageButton

# Reload Upgrade Buttons
@onready var p_reload_button = $PeaReloadButton
@onready var c_reload_button = $CataReloadButton
@onready var b_reload_button = $BouldReloadButton

# Projectile Upgrade Buttons
@onready var c_proj_button = $CataProjectButton

# Left Upgrade Buttons
@onready var p_left_button = $PeaLeftButton
@onready var c_left_button = $CataLeftButton
@onready var b_left_button = $BouldLeftButton

# Right Upgrade Buttons
@onready var p_right_button = $PeaRightButton
@onready var c_right_button = $CataRightButton
@onready var b_right_button = $BouldRightButton

var can_toggle_shop = false  # Whether you are allowed to open shop or not
var game_ui = null  # Game UI object
var upgrade_cost = 0  # Variable to hold current upgrade cost for buttons

# Upgrade costs per level
# Damage Up
var p_dmg_upgrade = [1500, 2000, 3000, 4000]
var c_dmg_upgrade = [1400, 2000, 3000, 4000]
var b_dmg_upgrade = []
# Reload Up
var p_reload_upgrade = [1300, 2000, 3000, 4000]
var c_reload_upgrade = [1200, 2000, 3000, 4000]
var b_reload_upgrade = [1100, 2000, 3000, 4000]
# Projectile Up
var p_proj_upgrade = []
var c_proj_upgrade = [1090, 2000, 3000, 4000]
var b_proj_upgrade = []
# Left
var p_left_upgrade = [1080, 2000, 3000, 4000]
var c_left_upgrade = [1070, 2000, 3000, 4000]
var b_left_upgrade = [1060, 2000, 3000, 4000]
# Right
var p_right_upgrade = [1050, 2000, 3000, 4000]
var c_right_upgrade = [1040, 2000, 3000, 4000]
var b_right_upgrade = [1030, 2000, 3000, 4000]

# Called when the node enters the scene tree for the first time.
func _ready():
	game_ui = get_parent().get_node("GameUI")
	
	# Update all the buttons with the first upgrade cost
	# Damage Upgrades
	update_cost(p_dmg_upgrade, p_dmg_button)
	update_cost(c_dmg_upgrade, c_dmg_button)
	# Reload Upgrades
	update_cost(p_reload_upgrade, p_reload_button)
	update_cost(c_reload_upgrade, c_reload_button)
	update_cost(b_reload_upgrade, b_reload_button)
	# Projectile Upgrades
	update_cost(c_proj_upgrade, c_proj_button)
	# Left Upgrades
	update_cost(p_left_upgrade, p_left_button)
	update_cost(c_left_upgrade, c_left_button)
	update_cost(b_left_upgrade, b_left_button)
	# Right Upgrades
	update_cost(p_right_upgrade, p_right_button)
	update_cost(c_right_upgrade, c_right_button)
	update_cost(b_right_upgrade, b_right_button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("open_shop"):
		if can_toggle_shop:
			visible = not visible

# Allows player to open shop
func enable_shop():
	can_toggle_shop = true

# Don't allow player to open shop
func disable_shop():
	can_toggle_shop = false

# Upgrade Peashooter damage if enough gold
func _on_pea_damage_button_pressed():
	upgrade_weapon(p_dmg_upgrade)
	update_cost(p_dmg_upgrade, p_dmg_button)

# Upgrade Peashooter reload speed if enough gold
func _on_pea_reload_button_pressed():
	upgrade_weapon(p_reload_upgrade)
	update_cost(p_reload_upgrade, p_reload_button)

# Upgrade Catapult damage if enough gold
func _on_cata_damage_button_pressed():
	upgrade_weapon(c_dmg_upgrade)
	update_cost(c_dmg_upgrade, c_dmg_button)

# Upgrade Catapult reload speed if enough gold
func _on_cata_reload_button_pressed():
	upgrade_weapon(c_reload_upgrade)
	update_cost(c_reload_upgrade, c_reload_button)

# Upgrade Catapult projectile if enough gold
func _on_cata_project_button_pressed():
	upgrade_weapon(c_proj_upgrade)
	update_cost(c_proj_upgrade, c_proj_button)

# Upgrade Boulder reload speed if enough gold
func _on_bould_reload_button_pressed():
	upgrade_weapon(b_reload_upgrade)
	update_cost(b_reload_upgrade, b_reload_button)

# Add 1 Peashooter on the left side if enough gold
func _on_pea_left_button_pressed():
	upgrade_weapon(p_left_upgrade)
	update_cost(p_left_upgrade, p_left_button)

# Add 1 Catapult on the left side if enough gold
func _on_cata_left_button_pressed():
	upgrade_weapon(c_left_upgrade)
	update_cost(c_left_upgrade, c_left_button)

# Add 1 Boulder on the left side if enough gold
func _on_bould_left_button_pressed():
	upgrade_weapon(b_left_upgrade)
	update_cost(b_left_upgrade, b_left_button)

# Add 1 Peashooter on the right side if enough gold
func _on_pea_right_button_pressed():
	upgrade_weapon(p_right_upgrade)
	update_cost(p_right_upgrade, p_right_button)

# Add 1 Catapult on the right side if enough gold
func _on_cata_right_button_pressed():
	upgrade_weapon(c_right_upgrade)
	update_cost(c_right_upgrade, c_right_button)

# Add 1 Boulder on the right side if enough gold
func _on_bould_right_button_pressed():
	upgrade_weapon(b_right_upgrade)
	update_cost(b_right_upgrade, b_right_button)

# Function to help update the cost in the button
# Takes in the upgrade array and the corresponding button
func update_cost(upgrade_array, button):
	if upgrade_array.size() > 0:
		button.text = str(upgrade_array[0]) + " Gold"
	else:
		button.text = "Maxed Out"

# Function to help upgrade the weapon
# Takes in the upgrade array for that specific weapon upgrade
func upgrade_weapon(upgrade_array):
	# Only upgrade if max level not reached
	if upgrade_array.size() > 0:
		# Check if it is affordable
		if game_ui.spend_currency(upgrade_array[0]):
			upgrade_array.pop_front()
