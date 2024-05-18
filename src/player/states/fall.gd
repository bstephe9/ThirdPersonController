extends PlayerState

@export
var idle_state: State
@export
var move_state: State

func process_physics(delta: float) -> State:
	super(delta)
	
	if parent.is_on_floor():
		if input_dir != Vector2.ZERO:
			return move_state
		return idle_state
	return null
