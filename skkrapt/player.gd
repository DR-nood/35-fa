extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 1000.0
const DECELERATION = 800.0
const MAX_JUMPS = 2  # الحد الأقصى لعدد القفزات

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

enum AnimationState {
	IDLE,
	RUN,
	JUMP
}

var current_animation: AnimationState = AnimationState.IDLE
var jumps_left = MAX_JUMPS

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	handle_jump()
	handle_movement(delta)
	update_animation()

func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		jumps_left = MAX_JUMPS  # إعادة تعيين عدد القفزات عند ملامسة الأرض

func handle_jump() -> void:
	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1  # تقليل عدد القفزات المتبقية
		current_animation = AnimationState.JUMP

func handle_movement(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	
	# عكس الصورة إذا كانت الشخصية تتحرك إلى اليسار
	animated_sprite_2d.flip_h = direction < 0

	if direction != 0:
		velocity.x = direction * SPEED
		if current_animation != AnimationState.JUMP:
			current_animation = AnimationState.RUN
	else:
		# التقليل التدريجي للسرعة عند التوقف
		velocity.x = move_toward(velocity.x, 0, DECELERATION * delta)
		# تغيير الحالة إلى الوقوف مباشرة عند التوقف
		if is_on_floor() and velocity.x == 0:
			current_animation = AnimationState.IDLE

	move_and_slide()

func update_animation() -> void:
	if is_on_floor():
		match current_animation:
			AnimationState.RUN:
				animated_sprite_2d.play("run")
			AnimationState.IDLE:
				animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("jump")



var score = 0




@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "you collected " +  str(score) + " coins."
