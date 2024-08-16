extends StaticBody2D

# $ is same as get_node
@onready var polygon_2d = $Polygon2D
@onready var collision_polygon_2d = $CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set transform and polygon the same as the polygon2d
	# Need to do both otherwise the collision could be somewhere else
	# but have the same shape
	collision_polygon_2d.transform = polygon_2d.transform
	collision_polygon_2d.polygon = polygon_2d.polygon
