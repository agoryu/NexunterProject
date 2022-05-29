extends Node2D

onready var rock := preload("res://Scenes/Objects/Rock.tscn")
onready var fish := preload("res://Scenes/Objects/Poisson.tscn")

onready var path := $ObjectSpawner/PathFollow2D

func _on_Timer_timeout():
	path.offset = randi()
	var new_rock = rock.instance()
	new_rock.position = path.position
	var new_fish = fish.instance()
	new_fish.position = path.position
	add_child(new_fish)
	add_child(new_rock)
