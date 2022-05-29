extends Node

signal game_over_signal

onready var tree := get_tree()

var score : int

func _ready():
	score = 0
	
func game_over():
	tree.paused = true
	emit_signal("game_over_signal")
