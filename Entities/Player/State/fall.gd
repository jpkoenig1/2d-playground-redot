# Fall.gd
extends State

func enter():
	player.animated_sprite.play("fall")

func physics_update(delta):
	# Apply gravity
	player.velocity.y += player.gravity * delta
	
	# Check landing
	if player.is_on_floor():
		state_machine.transition_to("Idle" if player.velocity.x == 0 else "Run")
	
	# Air control
	var input_dir = Input.get_axis("move_left", "move_right")
	player.velocity.x = input_dir * player.air_control_speed
