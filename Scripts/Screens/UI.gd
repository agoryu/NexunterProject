extends Control

onready var score_label = $Score
onready var game_over_node = $GameOver

func _ready():
	MainScript.connect("game_over_signal", self, "game_over")

func _on_Game_update_score():
	$Score.text = "%s" % MainScript.score

func game_over():
	game_over_node.visible = true
