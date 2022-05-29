extends Control

onready var score_label = $Score
onready var game_over_node = $GameOver

func _ready():
	#Game.connect("game_over_signal", self, "game_over")
	pass

func _on_Game_update_score(score : int):
	$Score.text = "%s" % score

func game_over():
	game_over_node.visible = true
