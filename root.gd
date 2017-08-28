extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var snake=[];
var scene = load("res://Particles2D.tscn")
var texture=load("res://box.tex");
var food=load("res://food.tscn");
var player=load("res://player.tscn");

func _ready():
	add_child(player.instance());
	addFood();
	pass

func addFood():
	var nfood=food.instance();
	nfood.set_pos(Vector2(rand_range(50,500),rand_range(50,500)));
	add_child(nfood);
	
func _input(event):
	if event.is_action_pressed('ui_right'):
		addFood();
		var test=Sprite.new();
		test.set_texture(texture);
		add_child(test);
		var particule=scene.instance();
		particule.add_to_group('parti');
		particule.set_pos(Vector2(rand_range(50,500),50));
		add_child(particule);
		
	if event.is_action_pressed('ui_left'):
		var lols=get_tree().get_nodes_in_group('parti');
		for lol in lols:
			lol.queue_free()
	