class_name Network
extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.peer_connected.connect(player_joined) 
	multiplayer.peer_disconnected.connect(player_left) # Replace with function body.
	# Replace with function body.

func player_joined(id):



