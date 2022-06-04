extends Node

signal game_over_signal

onready var tree := get_tree()
onready var CustomSortScore = preload("res://Scripts/Sort/CustomSortScore.gd")
onready var SAVE_PATH = "res://scores.json"
onready var save_file = File.new()

var score : int
var scores = Dictionary()

func _ready():
	score = 0
	
func game_over():
	tree.paused = true
	emit_signal("game_over_signal")
	
func load_data():
	if not save_file.file_exists(SAVE_PATH):
		print("ERROR: file does not exist (res://scores.json)")
		return 
	
	save_file.open(SAVE_PATH, File.READ)
	scores = parse_json(save_file.get_as_text())
	save_file.close()
	
func save_score(score: int, player_name: String):
	if scores == null or scores.empty():
		scores[player_name + String(score)] = [score, player_name]
	else:
		var score_list = scores.values()
		score_list.sort_custom(CustomSortScore, "sort_ascending")
		var previous_score = []
		for old_score in score_list:
			if score > old_score[0]:
				previous_score = old_score
			else:
				break
		
		if previous_score != []:
			if scores.size() > 9:
				scores.erase(score_list[0][1] + String(score_list[0][0]))
			scores[player_name + String(score)] = [score, player_name]
	
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_line(to_json(scores))
	save_file.close()
