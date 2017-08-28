extends KinematicBody2D

var offsetX=0
var offsetY=0
var x=0;
var y=0;
var head=[];
var bodies=[];

func _ready():
	set_process_input(true);
	set_process(true);

func setOffset(x,y):
	offsetX=x;
	offsetY=y;
	
func move():
	x=x+offsetX;
	y=y+offsetY;
	set_pos(Vector2(x,y));

func _input(event):
	if event.is_action_pressed('ui_right'):
		setOffset(10,0);
		
	if event.is_action_pressed('ui_left'):
		setOffset(-10,0);
		
	if event.is_action_pressed('ui_up'):
		setOffset(0,-10);
		
	if event.is_action_pressed('ui_down'):
		setOffset(0,10);
		
func _process(delta):
	move();
	
func eat():
	print('player eating');