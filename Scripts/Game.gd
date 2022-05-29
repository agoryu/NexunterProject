extends Node2D

signal game_over_signal
signal update_scrore

onready var timer_score = $TimerScore
onready var tree := get_tree()

var score : int

func _ready():
	score = 0

func _on_Timer_timeout():
	score += 1
	print(score)
	emit_signal("update_scrore", score)
	
func game_over():
	#timer_score.stop()
	tree.paused = true
	emit_signal("game_over_signal")
