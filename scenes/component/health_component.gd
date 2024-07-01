extends Node
class_name HealthComponent

signal died
@export var max_healt:int = 10
var current_health:int

func _ready():
	current_health = max_healt

func damage(damage_amount:int):
	current_health = max(current_health - damage_amount, 0)
	Callable(check_death).call_deferred()
	
func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()
