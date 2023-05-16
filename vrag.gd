extends CharacterBody2D

var speed = 50
var hero_chase = false
var hero = null

func  _physics_process(delta):
	if hero_chase:
		position += (hero.position - position)/speed
		$AnimatedSprite2D.play("slime_stop")
		
		if(hero.position.x - position.x ) > 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("slime_run")



func _on_detect_hero_body_entered(body):
	hero = body
	hero_chase = true 


func _on_detect_hero_body_exited(body):
	hero = null
	hero_chase = false
