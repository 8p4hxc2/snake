extends KinematicBody2D

var offsetX=0
var offsetY=0
var currentOffsetX=0;
var currentOffsetY=0;
var x=0;
var y=0;
var snake=[];
var bodyPart=preload("res://body.tscn");
var moving=0;

func _ready():
	snake.push_front(get_node("head"));
	set_process_input(true);
	set_process(true);

func setOffset(x,y):
	offsetX=x;
	offsetY=y;
	
func move(delta):
	moving=0;
	x=x+offsetX;
	y=y+offsetY;
	move_body();
	
func move_body():
	x+=offsetX/-10;
	y+=offsetY/-10;
	#var tail=snake.pop_back();
	var head=snake.back();
	
	head.set_pos(Vector2(x+64,y+64));
	
	if(snake.size()>1):
		snake.push_front(snake.back());	
		snake.pop_back();
		pass;
	
func _input(event):
	if event.is_action_pressed('ui_right'):
		setOffset(16,0);
		
	if event.is_action_pressed('ui_left'):
		setOffset(-16,0);
		
	if event.is_action_pressed('ui_up'):
		setOffset(0,-16);
		
	if event.is_action_pressed('ui_down'):
		setOffset(0,16);
		
func _process(delta):
	move(delta);
	
func eat(pos):
	var nBody=bodyPart.instance();
	nBody.set_pos(pos);
	snake.front().set_name('');
	nBody.set_name('head');
	snake.push_front(nBody);
	#bodies.push_front(nBody);
	add_child(nBody);
	print('player eating');
	#print(str(bodies.size())+' already eaten');


#velocityFromAngle: function (angle, speed, point) {

      #  if (speed === undefined) { speed = 60; }
       # point = point || new Phaser.Point();

        #return point.setTo((Math.cos(this.game.math.degToRad(angle)) * speed), (Math.sin(this.game.math.degToRad(angle)) * speed));

    #},