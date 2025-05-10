# A common class that defines generic state for a StateMachine
extends Node
class_name State

var state_machine: StateMachine
var player: CharacterBody2D

func enter():
	player = get_parent().get_parent()  # Assumes StateMachine is child of player

func physics_update(_delta): pass
func exit(): pass
