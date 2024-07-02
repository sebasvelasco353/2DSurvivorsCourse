extends Node

signal experience_updated(current_experience:float, target_experience:float)

const TARGET_EXPERIENCE_GROWTH = 5

var current_experience: int = 0
var current_level:int = 1
var target_experience:int = 5

func _ready():
	GameEvents.experience_vial_collected.connect(on_experience_vial_collected)

func increment_experience(number:int):
	current_experience = min(current_experience + number, target_experience)
	experience_updated.emit(current_experience, target_experience)
	if current_experience == target_experience:
		current_level += 1
		target_experience += TARGET_EXPERIENCE_GROWTH
		current_experience = 0
		experience_updated.emit(current_experience, target_experience)

func on_experience_vial_collected(number:int):
	increment_experience(number)
