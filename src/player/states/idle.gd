extends PlayerState

@export var walk_state: State
@export var run_state: State
@export var jump_state: State
@export var fall_state: State
@export var kick_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if !parent.is_on_floor(): return null
	
	if Input.is_action_just_pressed('jump'): return jump_state
	if Input.is_action_just_pressed('kick'): return kick_state
	
	return null

func process_physics(delta: float) -> State:
	super(delta)
	
	if !parent.is_on_floor():
		return fall_state
	if input_dir != Vector2.ZERO:
		if Input.is_action_pressed('sprint'): return run_state
		else: return walk_state
		
	return null
