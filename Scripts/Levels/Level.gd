extends Node2D

onready var rock := preload("res://Scenes/Objects/Rock.tscn")
onready var fish := preload("res://Scenes/Objects/Fish.tscn")
onready var trunk := preload("res://Scenes/Objects/Trunk.tscn")

onready var path := $ObjectSpawner/PathFollow2D

func _on_Timer_timeout():
	path.offset = randi()
	var new_rock = rock.instance()
	new_rock.position = path.position
	add_child(new_rock)

func _on_TimerFish_timeout():
	var new_fish = fish.instance()
	new_fish.position = Vector2.ZERO
	add_child(new_fish)

func _on_TimerTrunk_timeout():
	var new_trunk = trunk.instance()
	new_trunk.position = Vector2(300, 0)
	add_child(new_trunk)
