extends Node2D

signal update_score

onready var timer_score = $TimerScore

onready var music_intro = $AudioStreamPlayer_Intro
onready var music_main = $AudioStreamPlayer_Main
onready var music_gameover = $AudioStreamPlayer_GameOver

var score : int

func _ready():
	score = 0
	music_intro.play()

func _on_Timer_timeout():
	MainScript.score += 1
	print(score)
	emit_signal("update_score", score)
	
func game_over():
	#timer_score.stop()
	#tree.paused = true
	
	if music_intro.playing:
		music_intro.stop()
	if music_main.playing:
		music_main.stop()
	music_gameover.play()
	
	emit_signal("game_over_signal")
	
func _on_AudioStreamPlayer_Intro_finished():
	music_main.play()
