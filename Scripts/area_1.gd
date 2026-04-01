extends Node2D

@onready var road1 = $Road1
@onready var road2 = $Road2

var speed = 400
var height = 1536  # <- ustaw dokładnie jak Twój obraz!

func _process(delta):
	road1.position.y += speed * delta
	road2.position.y += speed * delta

	if road1.position.y >= height:
		road1.position.y = road2.position.y - height

	if road2.position.y >= height:
		road2.position.y = road1.position.y - height
