extends TextureButton
var is_button_pressed : bool = false
var key_1_pressed_last_frame : bool = false
var key_2_pressed_last_frame : bool = false
var key_3_pressed_last_frame : bool = false
var key_4_pressed_last_frame : bool = false
var key_5_pressed_last_frame : bool = false
var key_6_pressed_last_frame : bool = false
var key_7_pressed_last_frame : bool = false
var key_8_pressed_last_frame : bool = false
var key_9_pressed_last_frame : bool = false
var key_0_pressed_last_frame : bool = false
var key_enter_pressed_last_frame : bool = false
var key_back_pressed_last_frame : bool = false
var key_right_pressed_last_frame : bool = false

var skill_number : String = ""
var just_move_once = 0
var skill_bar = ""

@export var skill_bar_id = 0
var temp_id = 0

func set_temp_id_and_skillbar_name():
	if skill_bar_id < 5:
		skill_bar = "SkillsBar"
		temp_id = skill_bar_id
	else:
		skill_bar = "SkillsBar2"
		temp_id = skill_bar_id - 5


func remove_skill():
	$SkillSlot.texture = load("res://Assets/Textures/HUD/HUDCell.png")
	set_temp_id_and_skillbar_name()			
	get_parent().get_parent().get_parent().get_node("Bar").get_node(skill_bar).get_child(temp_id).skill = null
	get_parent().get_parent().get_parent().get_node("Bar").get_node(skill_bar).get_child(temp_id).texture_normal = load("res://Assets/Textures/HUD/HUDCell.png")


func add_skill(node, skill_number):
	if node is SkillNode:
		if int(skill_number) == node.id:
			if node.is_active == true:	
				for i in range(1,get_parent().get_child_count()):
					if get_parent().get_child(i).get_node("SkillSlot").texture == node.skill.texture:
						return
						
				$SkillSlot.texture = node.skill.texture
				set_temp_id_and_skillbar_name()	
				get_parent().get_parent().get_parent().get_node("Bar").get_node(skill_bar).get_child(temp_id).skill = node.skill
				get_parent().get_parent().get_parent().get_node("Bar").get_node(skill_bar).get_child(temp_id).texture_normal = node.skill.texture
				get_parent().get_parent().get_parent().get_node("Bar").get_node(skill_bar).get_child(temp_id).timer.wait_time = node.skill.cooldown
				get_parent().get_parent().get_parent().get_node("Bar").get_node(skill_bar).get_child(temp_id).skill_duration.wait_time = node.skill.duration
				get_parent().get_parent().get_parent().get_node("Bar").get_node(skill_bar).get_child(temp_id).tooltip_text = node.skill.title
			return
	
	for i in range(node.get_child_count()):
		if node.get_child(i) is SkillNode:
			var child = node.get_child(i)
			add_skill(child, skill_number)
			

func _ready():
	pass

func _process(delta):
	if is_button_pressed == true:
		if Input.is_key_pressed(KEY_1) and key_1_pressed_last_frame == false:
			skill_number += str(1)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
			key_1_pressed_last_frame = true
		if Input.is_key_pressed(KEY_2) and key_2_pressed_last_frame == false:
			skill_number += str(2)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
			key_2_pressed_last_frame = true
		if Input.is_key_pressed(KEY_3) and key_3_pressed_last_frame == false:
			skill_number += str(3)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
			key_3_pressed_last_frame = true
		if Input.is_key_pressed(KEY_4) and key_4_pressed_last_frame == false:
			skill_number += str(4)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
			key_4_pressed_last_frame = true
		if Input.is_key_pressed(KEY_5) and key_5_pressed_last_frame == false:
			skill_number += str(5)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
			key_5_pressed_last_frame = true
		if Input.is_key_pressed(KEY_6) and key_6_pressed_last_frame == false:
			skill_number += str(6)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
			key_6_pressed_last_frame = true
		if Input.is_key_pressed(KEY_7) and key_7_pressed_last_frame == false:
			skill_number += str(7)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
		if Input.is_key_pressed(KEY_8) and key_8_pressed_last_frame == false:
			skill_number += str(8)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
			key_8_pressed_last_frame = true
		if Input.is_key_pressed(KEY_9) and key_9_pressed_last_frame == false:
			skill_number += str(9)
			if len(skill_number) > 2:
				skill_number = ""
			$Label.text = skill_number
			key_9_pressed_last_frame = true	
		if Input.is_key_pressed(KEY_ENTER) and key_enter_pressed_last_frame == false:
			key_enter_pressed_last_frame = true
			add_skill(get_parent().get_parent().get_node("SkillTree"),skill_number)
			skill_number = ""
			$Label.text = skill_number
		if Input.is_key_pressed(KEY_BACKSPACE) and key_back_pressed_last_frame == false:
			key_back_pressed_last_frame = true
			skill_number = ""
			$Label.text = ""
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) and key_right_pressed_last_frame == false:
			remove_skill()
			key_right_pressed_last_frame = true

	if !Input.is_key_pressed(KEY_1):
		key_1_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_2):
		key_2_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_3):
		key_3_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_4):
		key_4_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_5):
		key_5_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_6):
		key_6_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_7):
		key_7_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_8):
		key_8_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_9):
		key_9_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_ENTER):
		key_enter_pressed_last_frame = false
	if !Input.is_key_pressed(KEY_BACKSPACE):
		key_back_pressed_last_frame = false
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		key_right_pressed_last_frame = false
				
func _on_mouse_entered():
	$Label.modulate = Color.RED
	skill_number = ""
	$Label.text = ""

func _on_mouse_exited():
	$SkillSlot.modulate = Color.WHITE_SMOKE
	skill_number = ""
	$Label.text = ""
	is_button_pressed = false
	get_parent().get_parent().get_parent().get_node("Bar").process_mode = Node.PROCESS_MODE_INHERIT

func _on_pressed():
	$SkillSlot.modulate = Color.LAVENDER
	is_button_pressed = true
	get_parent().get_parent().get_parent().get_node("Bar").process_mode = Node.PROCESS_MODE_DISABLED
