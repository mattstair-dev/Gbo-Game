extends Node2D

onready var scene = load("res://Item.tscn")
onready var item = scene.instance()

#this is just a test
#this is the second test


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
		item.set_name("item_" + str(location))
		get_tree().get_root().call_deferred("add_child", item)
		item.position = Vector2(location * tileMap.cell_size)
#		print(item.position)
	tileMap.update_bitmask_region(borders.position, borders.end)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
