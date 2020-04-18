extends Node2D

const LVL_PATH = "res://levels/Level%d.tscn"

var lvl_num: int = 1


func _ready() -> void:
	call_deferred("_init")


func _init() -> void:
	load_level(lvl_num)


func load_level(num:int):
	var root = get_tree().root
	if root.has_node("Level"):
		root.remove_child($Level)
		
	# TODO : check if lvl actually exists
	var lvl = load(LVL_PATH % num).instance()
	root.add_child(lvl)
	return true
