extends Control

signal score_saved

var accepted = false
var letter_selected = 0
var label_selected = 0
var player_name = []

onready var button_ok = $SaveButton
onready var animation = $NameLetter/AnimationPlayer
onready var timer = $NameLetter/Timer
onready var letter = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
onready var label = [$NameLetter/Label, $NameLetter/Label2, $NameLetter/Label3]

func _ready():
	self.set_process_unhandled_input(false)

func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		set_letter(letter_selected + 1)
	if event.is_action_pressed("ui_down"):
		set_letter(letter_selected - 1)
	if event.is_action_released("ui_accept"):
		if label_selected == 2:
			player_name.push_back(letter[letter_selected])
			button_ok.visible = true
			button_ok.grab_focus()
		else:
			label_selected += 1
			player_name.push_back(letter[letter_selected])
			letter_selected = 0
			label[label_selected - 1].valign = 1
		animation.stop()
	if event.is_action_released("ui_back"):
		if label_selected != 0:
			label_selected -= 1
			player_name.push_back(letter[letter_selected])
			
func _process(delta):
	if !animation.is_playing():
		animation.play(String(label_selected))

func _on_NameSaver_visibility_changed():
	self.set_process_unhandled_input(visible)

func _on_SaveButton_button_up():
	self.visible = false
	var player_name_label = player_name[0] + player_name[1] + player_name[2]
	MainScript.save_score(MainScript.score, player_name_label)
	emit_signal("score_saved")

func set_letter(letter_position):
	letter_selected = fmod(letter_position, 26) 
	label[label_selected].text = letter[letter_selected]
	label[label_selected].grab_focus()
