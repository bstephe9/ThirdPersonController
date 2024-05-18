extends PlayerState

@export var idle_state: State
@export var fall_state: State

func enter() -> void:
	super()
	parent.velocity.y = parent.jump_velocity

func process_physics(delta: float) -> State:
	super(delta)
	
	if parent.velocity.y < 0:
		return fall_state
		
	if parent.is_on_floor():
		if input_dir == Vector2.ZERO: return idle_state
		
	return null
