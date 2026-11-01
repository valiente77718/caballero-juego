extends CharacterBody2D

const VELOCIDAD = 120.0
const VELOCIDAD_CORRER = 200.0
const SALTO = -280.0
const GRAVEDAD = 900.0
const MAX_SALTOS = 2

var saltos_restantes = MAX_SALTOS

func _physics_process(delta):
	if is_on_floor():
		saltos_restantes = MAX_SALTOS
	else:
		velocity.y += GRAVEDAD * delta

	if Input.is_action_just_pressed("ui_accept") and saltos_restantes > 0:
		velocity.y = SALTO
		saltos_restantes -= 1

	var direccion = Input.get_axis("ui_left", "ui_right")
	var velocidad = VELOCIDAD_CORRER if Input.is_key_pressed(KEY_SHIFT) else VELOCIDAD
	velocity.x = direccion * velocidad
	if direccion != 0:
		$Sprite2D.flip_h = direccion < 0

	move_and_slide()
