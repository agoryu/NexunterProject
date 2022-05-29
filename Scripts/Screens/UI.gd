extends Control

onready var score_label = $Score

func _on_Game_update_scrore(score : int):
	$Score.text = "%s" % score
