extends CanvasLayer

# Damage Upgrade Buttons
@onready var p_dmg_button = $PeaDamageButton
@onready var c_dmg_button = $CataDamageButton

# Reload Upgrade Buttons
@onready var p_reload_button = $PeaReloadButton
@onready var c_reload_button = $CataReloadButton
@onready var b_reload_button = $BouldReloadButton

# Size Upgrade Buttons
@onready var p_size_button = $PeaSizeButton
@onready var c_size_button = $CataSizeButton
@onready var b_size_button = $BouldSizeButton

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
var p_dmg_upgrade = []
var c_dmg_upgrade = []
var b_dmg_upgrade = []
# Reload Up
var p_reload_upgrade = []
var c_reload_upgrade = []
var b_reload_upgrade = []
# Projectile Up
var p_size_upgrade = []
var c_size_upgrade = []
var b_size_upgrade = []
# Left
var p_left_upgrade = []
var c_left_upgrade = []
var b_left_upgrade = []
# Right
var p_right_upgrade = []
var c_right_upgrade = []
var b_right_upgrade = []

# Called when the node enters the scene tree for the first time.
func _ready():
	game_ui = get_parent().get_node("GameUI")
	reset_upgrades()
	reset_upgrade_costs()

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

# Upgrade Peashooter size if enough gold
func _on_pea_size_up_pressed():
	upgrade_weapon(p_size_upgrade)
	update_cost(p_size_upgrade, p_size_button)

# Upgrade Catapult damage if enough gold
func _on_cata_damage_button_pressed():
	upgrade_weapon(c_dmg_upgrade)
	update_cost(c_dmg_upgrade, c_dmg_button)

# Upgrade Catapult reload speed if enough gold
func _on_cata_reload_button_pressed():
	upgrade_weapon(c_reload_upgrade)
	update_cost(c_reload_upgrade, c_reload_button)

# Upgrade Catapult size if enough gold
func _on_cata_size_button_pressed():
	upgrade_weapon(c_size_upgrade)
	update_cost(c_size_upgrade, c_size_button)

# Upgrade Boulder reload speed if enough gold
func _on_bould_reload_button_pressed():
	upgrade_weapon(b_reload_upgrade)
	update_cost(b_reload_upgrade, b_reload_button)

# Upgrade Boulder size if enough gold
func _on_bould_size_button_pressed():
	upgrade_weapon(b_size_upgrade)
	update_cost(b_size_upgrade, b_size_button)

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

# Reset upgrades progress to stage 1
func reset_upgrades():
	# Upgrade costs per level
	# Damage Up
	p_dmg_upgrade = [1500, 2000, 3000, 4000]
	c_dmg_upgrade = [1400, 2000, 3000, 4000]
	b_dmg_upgrade = []
	# Reload Up
	p_reload_upgrade = [1300, 2000, 3000, 4000]
	c_reload_upgrade = [1200, 2000, 3000, 4000]
	b_reload_upgrade = [1100, 2000, 3000, 4000]
	# Projectile Up
	p_size_upgrade = [1001, 2000, 3000, 4000]
	c_size_upgrade = [1090, 2000, 3000, 4000]
	b_size_upgrade = [1002, 2000, 3000, 4000]
	# Left
	p_left_upgrade = [1080, 2000, 3000, 4000]
	c_left_upgrade = [1070, 2000, 3000, 4000]
	b_left_upgrade = [1060, 2000, 3000, 4000]
	# Right
	p_right_upgrade = [1050, 2000, 3000, 4000]
	c_right_upgrade = [1040, 2000, 3000, 4000]
	b_right_upgrade = [1030, 2000, 3000, 4000]

# Reset upgrade costs
func reset_upgrade_costs():
	# Update all the buttons with the first upgrade cost
	# Damage Upgrades
	update_cost(p_dmg_upgrade, p_dmg_button)
	update_cost(c_dmg_upgrade, c_dmg_button)
	# Reload Upgrades
	update_cost(p_reload_upgrade, p_reload_button)
	update_cost(c_reload_upgrade, c_reload_button)
	update_cost(b_reload_upgrade, b_reload_button)
	# Size Upgrades
	update_cost(p_size_upgrade, p_size_button)
	update_cost(c_size_upgrade, c_size_button)
	update_cost(b_size_upgrade, b_size_button)
	# Left Upgrades
	update_cost(p_left_upgrade, p_left_button)
	update_cost(c_left_upgrade, c_left_button)
	update_cost(b_left_upgrade, b_left_button)
	# Right Upgrades
	update_cost(p_right_upgrade, p_right_button)
	update_cost(c_right_upgrade, c_right_button)
	update_cost(b_right_upgrade, b_right_button)
