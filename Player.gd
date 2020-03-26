extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400
var screen_size
signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$PlayAnimatedSprite.play()
	else:
		$PlayAnimatedSprite.stop()	
	position += velocity * delta
	position.x = clamp(position.x,0,screen_size.x)
	position.y = clamp(position.y,0,screen_size.y)
	
	if velocity.x != 0:
		$PlayAnimatedSprite.animation = "right"
		$PlayAnimatedSprite.flip_v = false
		$PlayAnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$PlayAnimatedSprite.animation = "up"
		$PlayAnimatedSprite.flip_h = false
		$PlayAnimatedSprite.flip_v = velocity.y > 0
	


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled",true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
