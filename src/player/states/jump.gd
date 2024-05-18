extends PlayerState

@export
var fall_state: State
@export
var idle_state: State
@export
var walk_state: State

@export
var jump_force: float = 900.0

func enter() -> void:
	super()
	player.velocity.y = -jump_force

func process_physics(delta: float) -> State:
	super(delta)
	
	if player.velocity.y > 0:
		return fall_state
	
	if player.is_on_floor():
		if input_dir != Vector2.ZERO:
			return walk_state
		return idle_state
	
	return null
