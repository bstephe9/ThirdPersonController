class_name Player
extends CharacterBody3D

@export var speed: float = 5.0
@export var run_speed: float = 8.0
@export var jump_velocity = 4.5

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var animations = $mixamo_base/AnimationPlayer
@onready var state_machine = $StateMachine

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
