# Common class to handle all types of state machines  

extends Node
class_name StateMachine

signal state_changed(new_state)


var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	# Collect all possible states
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.state_machine = self
	current_state = states["Idle"]
	current_state.enter()		

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

func transition_to(new_state_name: String):
	if not states.has(new_state_name): return
	
	current_state.exit()
	current_state = states[new_state_name]
	current_state.enter()
	emit_signal("state_changed", current_state.name)
