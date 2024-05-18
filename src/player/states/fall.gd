extends PlayerState

@export var idle_state: State
@export var walk_state: State
@export var run_state: State

func process_physics(delta: float) -> State:
	super(delta)
	
	if parent.is_on_floor():
		if input_dir == Vector2.ZERO: return idle_state
		
		if Input.is_action_pressed("sprint"): return run_state
		else: return walk_state
		
	return null
