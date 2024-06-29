extends CharacterBody2D
class_name BasicEnemy

const MAX_SPEED:int = 50
@onready var area_2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	area_2d.area_entered.connect(on_area_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()

func get_direction_to_player():
	var player_node = get_tree().get_first_node_in_group("player") as Node2D # Get the player
	if player_node != null: # if theres a player
		return (player_node.global_position - global_position).normalized() # we get the position of the player minus our position and normalize it to get a vector we can use
	return Vector2.ZERO

func on_area_entered(_other_area:Area2D):
	queue_free()
