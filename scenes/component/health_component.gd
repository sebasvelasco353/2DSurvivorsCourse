extends Node
class_name HealthComponent

signal died
signal health_changed

@export var max_healt:float = 10
var current_health:float

func _ready():
	current_health = max_healt

func damage(damage_amount:float):
	current_health = max(current_health - damage_amount, 0)
	health_changed.emit()
	Callable(check_death).call_deferred()

func get_health_percent():
	if max_healt <= 0:
		return 0
	return min(current_health / max_healt, 1)

func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()
