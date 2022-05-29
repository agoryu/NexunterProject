extends Node2D

signal update_score

onready var timer_score = $TimerScore

onready var music_intro = $Music/AudioStreamPlayer_Intro
onready var music_main = $Music/AudioStreamPlayer_Main
onready var music_gameover = $Music/AudioStreamPlayer_GameOver

var score : int

func _ready():
	score = 0
	music_intro.play()
	MainScript.connect("game_over_signal", self, "_on_game_over")

func _on_game_over():
	music_gameover.play()
	
func _on_Timer_timeout():
	MainScript.score += 1
	emit_signal("update_score", score)
	
func _on_AudioStreamPlayer_Intro_finished():
	music_main.play()
