class_name PlayerState
extends State
## Processes the shared physics behavior between all player states, such 
## as getting input direction, and applying gravity. 

var input_dir: Vector2
var direction: Vector3

func process_physics(delta: float) -> State:
	if not parent.is_on_floor():
		parent.velocity.y -= gravity * delta

	input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	direction = (parent.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		parent.velocity.x = direction.x * parent.speed
		parent.velocity.z = direction.z * parent.speed
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, parent.speed)
		parent.velocity.z = move_toward(parent.velocity.z, 0, parent.speed)
	
	parent.move_and_slide()

	return null
