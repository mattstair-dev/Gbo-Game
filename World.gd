extends Node2D

export (PackedScene) var item
onready var itemContainer = get_node("Item_Container")

var borders = Rect2(1, 1, 38, 21)
var start_position = Vector2(1, 1)
var player_start = Vector2(2, 2)
var map_size = 200

onready var tileMap = $TileMap

func _ready():
	randomize()
	generate_level()
	$Player.position = (player_start * tileMap.cell_size)
	

func generate_level():
	var walker = Walker.new(start_position, borders)
	var map = walker.walk(map_size)
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
		if randi() % 75 == 0:
			var addItem = item.instance()
			itemContainer.add_child(addItem)
			addItem.position = Vector2(location * tileMap.cell_size)
	tileMap.update_bitmask_region(borders.position, borders.end)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
		globalStats.score = 0
