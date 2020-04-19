extends Node2D

const LVL_PATH = "res://levels/Level%d.tscn"

#onready var root := get_tree().get_root()
var root = null

var lvl_num: int = 1


func _ready() -> void:
	root = get_tree().get_root()
	call_deferred("_init")
	
	
func _init() -> void:
	load_level(lvl_num)
	

func load_level(num:int):
#	var root = get_tree().root
	if root.has_node("Level"):
		$Level.queue_free()
		
	# TODO : check if lvl actually exists
	var lvl = load(LVL_PATH % num).instance()
	root.add_child(lvl)
	return true
