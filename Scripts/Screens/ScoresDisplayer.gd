extends Control

onready var CustomSortScore = preload("res://Scripts/Sort/CustomSortScore.gd")
onready var lines_displayer = $Lines

var new_line_scene = preload("res://Scenes/Screens/LineScore.tscn")

func _on_Lines_visibility_changed():
	if !visible:
		pass
	
	var scores = MainScript.scores
	var score_list = scores.values()
	
	if scores.size() > 1:
		score_list.sort_custom(CustomSortScore, "sort_descending")
	
	for i in scores.size():
		create_line(score_list[i][1], String(score_list[i][0]))

func create_line(name: String, score: String):
	var line = new_line_scene.instance()
	line.init(name, score)
	lines_displayer.add_child(line)
