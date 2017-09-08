extends Node2D

func _ready():
	connect("body_enter", self, "on_body_enter");
	pass
	
func on_body_enter(body):
	if (body.get_name()=="head"):
		body.get_owner().eat(get_pos());
		moveFood();
	
func moveFood():
	set_pos(Vector2(rand_range(50,500),rand_range(50,500)));