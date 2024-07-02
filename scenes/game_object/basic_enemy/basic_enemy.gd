extends CharacterBody2D
class_name BasicEnemy

const MAX_SPEED:int = 50
@onready var health_component = $HealthComponent

func _process(_delta):
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()

func get_direction_to_player():
	var player_node = get_tree().get_first_node_in_group("player") as Node2D # Get the player
	if player_node != null: # if theres a player
		return (player_node.global_position - global_position).normalized() # we get the position of the player minus our position and normalize it to get a vector we can use
	return Vector2.ZERO
