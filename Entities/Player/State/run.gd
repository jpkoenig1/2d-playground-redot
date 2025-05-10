# Run.gd
extends State

func enter():
	player.animated_sprite.play("run")

func physics_update(delta):
	var input_dir = Input.get_axis("move_left", "move_right")
	
	# Horizontal movement
	player.velocity.x = input_dir * player.run_speed
	
	# Flip sprite based on direction
	if input_dir != 0:
		player.animated_sprite.flip_h = input_dir < 0
	
	# Check transitions
	if input_dir == 0:
		state_machine.transition_to("Idle")
	elif not player.is_on_floor():
		state_machine.transition_to("Fall")
