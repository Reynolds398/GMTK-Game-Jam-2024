extends CanvasLayer

@onready var currency_text = $CurrencyText
@onready var health_bar = $HealthBar

@export var MAX_GOLD = 999999

var currency = 0  # Value of total currency

var parent = null  # Parent object
var upgrade_ui = null  # Upgrade UI object

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	upgrade_ui = parent.get_node("UpgradeUI")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# For debugging purposes
#	if Input.is_key_pressed(KEY_EQUAL):
#		add_currency(1000)
#		add_health(5)
#	if Input.is_key_pressed(KEY_MINUS):
#		decrease_health(5)
#		spend_currency(1000)
	
	currency_text.text = str(currency)

# Function to add the amount to the total currency
func add_currency(amount):
	currency = clampi(currency + amount, 0, MAX_GOLD)

# Function to reduce the total currency by the amount
# Returns true if successful and false if unsuccessful
func spend_currency(amount):
	if (currency - amount) >= 0:
		currency -= amount
		return true
	else:
		return false

# Function to add health to the health bar
func add_health(amount):
	health_bar.value += amount

# Function to decrease health to the health bar
func decrease_health(amount):
	health_bar.value -= amount
	
	# Game over if health bar is 0%
	if health_bar.value == 0:
		game_over()

# Function to set max health
func set_max_health(amount):
	health_bar.max_value = amount
	health_bar.value = amount

# Function to handle game over
func game_over():
	pass

# Toggle cheat tools on and off
func _on_cheat_button_pressed():
	var cheat_tool = parent.get_node("CheatTools")
	cheat_tool.visible = not cheat_tool.visible

# Toggle visibility
func _on_shop_button_pressed():
	upgrade_ui.visible = not upgrade_ui.visible
