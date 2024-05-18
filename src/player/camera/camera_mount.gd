extends Node3D

@export var h_sensitivity = GameVariables.horizontal_sensitivity
@export var v_sensitivity = GameVariables.vertical_sensitivity

@export var v_ground_limit = -PI/3; 
@export var v_sky_limit = PI/4

@onready var dx = 0
@onready var dy = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		dx = -event.relative.y * v_sensitivity
		dy = -event.relative.x * h_sensitivity
		
		## For horizontal rotation, rotate the player. Since the camera is
		## attached to the player, rotating the player rotates the camera.
		get_parent().rotate_y(deg_to_rad(dy))
		
		## Vertical rotation
		rotate_x(deg_to_rad(dx))
		rotation.x = clamp(rotation.x, v_ground_limit, v_sky_limit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("(%s, %s) %s" % [dx, dy, rotation])
	pass
