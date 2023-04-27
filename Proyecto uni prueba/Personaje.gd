extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -400.0
const FRICTION = 1.2
const gravity = 20
var friccion: int = 0
var Doble_salto: int = 0 


func _physics_process(delta):
	MovimientoPj(delta)     # Mueve al pj.
	Doblesalto()
	Planear()
	# Agrego la gravedad
	if not is_on_floor():
		velocity.y += gravity


#	if Input.is_action_just_released("ui_left"):
#		velocity.x -= SPEED - 500
##		if velocity.x <= 0:
##			velocity.x = 0
#
#

	if Input.is_action_just_released("MoverDerecha"):
		
		pass
	move_and_slide()

	pass







#Funciones:
func Planear():
	if Input.is_action_pressed("Planear"):
		if velocity.y > 0 and !is_on_floor():
			velocity.y = 30 

func Doblesalto():
		if Input.is_action_just_pressed("ui_up") and Doble_salto < 2:
			velocity.y = JUMP_VELOCITY
			Doble_salto += 1

		if Input.is_action_just_pressed("ui_up") and not is_on_floor() and Doble_salto < 2:
			velocity.y = JUMP_VELOCITY
			Doble_salto += 2

		if Doble_salto >= 2 and is_on_floor():
			Doble_salto = 0


func MovimientoPj(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		friccion = 0
	else:
			velocity.x = move_toward(velocity.x,0,SPEED)
#			friccion += FRICTION * delta
#			friccion = clamp(friccion,0,1)



