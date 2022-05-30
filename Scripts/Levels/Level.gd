extends Node2D

onready var rock := preload("res://Scenes/Objects/Rock.tscn")
onready var fish := preload("res://Scenes/Objects/Fish.tscn")
onready var trunk := preload("res://Scenes/Objects/Trunk.tscn")

export var rock_time : float = 3
export var fish_time : float = 5
export var trunk_time : float = 10

onready var path := $ObjectSpawner/PathFollow2D

func _on_Timer_timeout():
	path.offset = randi()
	create_object(rock.instance(), path.position, rock_time, $Timer/TimerRock)

func _on_TimerFish_timeout():
	create_object(fish.instance(), Vector2.ZERO, fish_time, $Timer/TimerFish)

func _on_TimerTrunk_timeout():
	create_object(trunk.instance(), Vector2(300, 0), trunk_time, $Timer/TimerTrunk)
	
func create_object(object : Node2D, object_position : Vector2, object_time : float, timer : Timer):
	if not object_time == timer.wait_time:
		timer.wait_time = object_time
	object.position = object_position
	add_child(object)
