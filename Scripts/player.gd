extends CharacterBody2D

var lanes = [-240.0, 0.0, 240.0]
var current_lane = 1
var speed = 10.0

func _ready():
	position.x = lanes[current_lane]

func _input(event):
	if event.is_action_pressed("move_left"):
		current_lane = max(0, current_lane - 1)
	elif event.is_action_pressed("move_right"):
		current_lane = min(2, current_lane + 1)

func _process(delta):
	var target_x = lanes[current_lane]
	position.x = lerp(position.x, target_x, speed * delta)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		print("Trafiony! Wywołuję game_over...")
		
		# Przeszukujemy drzewo w górę, aż znajdziemy skrypt z game_over
		var p = get_parent()
		while p != null:
			if p.has_method("game_over"):
				p.game_over()
				return # Znaleźliśmy, wychodzimy
			p = p.get_parent()
			
		print("BŁĄD: Przeszukałem całe drzewo i nikt nie ma funkcji game_over")
