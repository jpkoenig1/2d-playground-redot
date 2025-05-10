extends CharacterBody2D

@export var run_speed := 300.0
@export var air_control_speed := 200.0
@export var gravity := 980.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $StateMachine

func _physics_process(delta):
	move_and_slide()
