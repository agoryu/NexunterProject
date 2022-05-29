extends Node2D

signal update_score

onready var timer_score = $TimerScore

func _process(delta):
	if not $AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.play()

func _on_Timer_timeout():
	MainScript.score += 1
	emit_signal("update_score")
