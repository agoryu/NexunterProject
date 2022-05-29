extends Node2D

onready var rock := preload("res://Scenes/Objects/Rock.tscn")

onready var path := $ObjectSpawner/PathFollow2D


func _on_Timer_timeout():
	path.offset = randi()
	var new_rock = rock.instance()
	new_rock.position = path.position
	add_child(new_rock)
