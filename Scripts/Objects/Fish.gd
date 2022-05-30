extends Path2D

export var minSpeed : float = 50
export var maxSpeed : float = 80

onready var path_follow = $PathFollow2D
onready var fish = $PathFollow2D/Area2D

var speed : float = 0.0
var xPosition : float = 0.0

func _ready():
	speed = rand_range(minSpeed, maxSpeed)
	xPosition = randi() % 1200
	path_follow.offset = float(xPosition)

func _physics_process(delta):
	self.position.y += speed * delta
	xPosition += delta
	path_follow.offset = xPosition * speed
