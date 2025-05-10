# Idle.gd
extends State

func physics_update(delta):
	# Check transitions
	if not player.is_on_floor():
		state_machine.transition_to("Fall")
	elif Input.get_axis("move_left", "move_right") != 0:
		state_machine.transition_to("Run")
	
	# Update animations
	player.animated_sprite.play("idle")
