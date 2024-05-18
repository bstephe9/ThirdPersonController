extends PlayerState

@export
var fall_state: State
@export
var jump_state: State
@export
var walk_state: State

func enter() -> void:
	super()
	player.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and player.is_on_floor():
		return jump_state
	if Input.get_vector("move_left", "move_right", "move_forward", "move_backwards"):
		return walk_state
	return null

func process_physics(delta: float) -> State:
	super(delta)
	
	if !player.is_on_floor():
		return fall_state
	return null
