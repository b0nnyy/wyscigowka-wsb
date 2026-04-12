extends CharacterBody2D

@onready var sprite = $Sprite2D

var textures = [
	preload("res://art/Sprite1.png"),
	preload("res://art/Sprite2.png")
]

var speed = 500.0

func _ready():
	speed = randf_range(550.0, 1000.0)
	sprite.texture = textures[randi() % textures.size()]

func _process(delta):
	position.y += speed * delta

	if position.y > 1500:
		queue_free()
