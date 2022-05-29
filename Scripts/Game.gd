extends Node2D

signal update_scrore

var score : int

func _ready():
	score = 0

func _on_Timer_timeout():
	score += 1
	emit_signal("update_scrore", score)
