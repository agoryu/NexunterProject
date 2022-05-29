extends Control

onready var score_label = $Score
onready var game_over_node = $GameOver

func _ready():
	Game.connect("game_over_signal", self, "game_over")

func _on_Game_update_scrore(score : int):
	$Score.text = "%s" % score

func game_over():
	game_over_node.visible = true
