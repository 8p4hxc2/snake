extends Node2D

func _ready():
	connect("body_enter", self, "on_body_enter");
	pass
	
func on_body_enter(body):
	body.get_owner().eat();