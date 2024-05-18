extends Node3D

var mouse_captured: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	capture_mouse()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("exit"): get_tree().quit()
	if Input.is_action_just_pressed("ui_text_indent"):
		release_mouse() if mouse_captured else capture_mouse()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process_(delta: float) -> void:
	pass

func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true

func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false
