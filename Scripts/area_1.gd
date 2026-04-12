extends Node2D

@onready var game_over_label = $CanvasLayer/GameOverLabel
@onready var road1 = $Road1
@onready var road2 = $Road2

var speed = 400.0
var road_height = 1536.0 
var is_game_over = false
var enemy_scene = preload("res://Scenes/Enemy.tscn")

var spawn_timer = 0.0
var spawn_delay = 1.2

var lanes = [-240.0, 0.0, 240.0]

func _process(delta):
	if is_game_over:
		return
	road1.position.y += speed * delta
	road2.position.y += speed * delta

	if road1.position.y >= road_height:
		road1.position.y = road2.position.y - road_height

	if road2.position.y >= road_height:
		road2.position.y = road1.position.y - road_height

	spawn_timer += delta
	if spawn_timer >= spawn_delay:
		spawn_timer = 0
		spawn_enemy()
		spawn_delay = randf_range(1.0, 1.5)

func spawn_enemy():
	var enemy = enemy_scene.instantiate()

	var lane = randi() % 3
	enemy.position.x = lanes[lane]
	enemy.position.y = -200

	add_child(enemy)

func game_over():
	print("FUNKCJA GAME_OVER ZOSTAŁA URUCHOMIONA!") # To musi się pojawić w konsoli
	is_game_over = true
	
	if game_over_label:
		game_over_label.visible = true
	else:
		print("BŁĄD: Nie znaleziono GameOverLabel!")
	Engine.time_scale = 0
	
func _input(event):
	if is_game_over and event.is_action_pressed("restart"):
		Engine.time_scale = 1.0;
		get_tree().reload_current_scene()
