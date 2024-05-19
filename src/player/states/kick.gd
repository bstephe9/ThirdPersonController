extends PlayerState

@export var idle_state: State

func enter() -> void:
	super()

func process_physics(_delta: float) -> State:
	return null

func process_frame(_delta: float) -> State:
	if !parent.animations.is_playing():
		return idle_state
	
	return null
