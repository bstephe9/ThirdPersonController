class_name PlayerState
extends State
## Processes the shared physics behavior between all player states, such 
## as getting input direction, applying gravity, and moving the player. 

@onready var player: Player = parent

var input_dir: Vector2
var direction: Vector3

func process_physics(delta: float) -> State:
	if not player.is_on_floor():
		player.velocity.y -= gravity * delta

	input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		player.velocity.x = direction.x * player.speed
		player.velocity.z = direction.z * player.speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
		player.velocity.z = move_toward(player.velocity.z, 0, player.speed)

	player.move_and_slide()
	
	return null
