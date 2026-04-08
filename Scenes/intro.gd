extends Control

@onready var label = $Label

var texts = [
	"Kiedyś wszystko działało...",
	"Extranet czasem się zawieszał...",
	"Ale dawał radę...",
	"",
	"Aż pewnego dnia...",
	"pojawiło się MERITOGO...",
	"",
	"I wszystko przestało działać.",
	"",
	"PRZETRWAJ.",
    "Unikaj MeritoGo."
]

func _ready():
	show_texts()

func show_texts():
	for t in texts:
		label.text = t
		await get_tree().create_timer(2.0).timeout
	
	get_tree().change_scene_to_file("res://Scenes/area_1.scn")
