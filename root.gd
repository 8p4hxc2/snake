extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var snake=[];

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	snake.push_front('omg');
	pass

func _input(event):
	