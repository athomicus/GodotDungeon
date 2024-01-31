extends Node
var current_experience = 0

func _ready():
	GameEvents.experience_vial_collected.connect(on_experience)

func on_experience(number: float):
	increment_experience(number)

func increment_experience(number: float):
	current_experience += number

