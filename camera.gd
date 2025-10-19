extends Camera2D

var speed = 200  # Speed in pixels per second

func _process(delta: float) -> void:
	var input_vector = Vector2()

	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	#if Input.is_action_just_pressed("ui_select"):
		
		
	if InputEventMouse:
		var mousepos = get_local_mouse_position()
		# print("mouse:"+str(mousepos))
		if (mousepos.x) <= 10:
			input_vector.x -=1
		if  mousepos.x >= 1880:
			input_vector.x +=1
		if mousepos.y <= 10:
			input_vector.y -=1
		if mousepos.y >=  1030:
			input_vector.y	 +=1
			

	# Normalize the vector to ensure consistent speed in all directions
	input_vector = input_vector.normalized()

	# Update the position based on input and speed
	self.position += input_vector * speed * delta
	#print("Camera position:", self.position," Vector:", input_vector)  # Debugging print statement
