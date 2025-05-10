extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D):
	if body.name != "Player":
		return
	print("Played in Killzone")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeoue() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
