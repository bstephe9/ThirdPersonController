extends PlayerState

@export
var fall_state: State
@export
var idle_state: State
@export
var jump_state: State

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and player.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	super(delta)
	
	if input_dir == Vector2.ZERO:
		return idle_state
	if !player.is_on_floor():
		return fall_state
	return null
