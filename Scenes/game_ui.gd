extends CanvasLayer

@onready var currency_text = $CurrencyText

@export var MAX_GOLD = 999999

var currency = 0  # Value of total currency

## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# For debugging purposes
	if Input.is_key_pressed(KEY_EQUAL):
		add_currency(1000)
	if Input.is_key_pressed(KEY_MINUS):
		spend_currency(1000)
	
	currency_text.text = str(currency)

# Function to add the amount to the total currency
func add_currency(amount):
	currency = clampi(currency + amount, 0, MAX_GOLD)

# Function to reduce the total currency by the amount
func spend_currency(amount):
	if (currency - amount) >= 0:
		currency -= amount
