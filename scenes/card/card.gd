extends Node2D

export(String) var Name
export(int) var Value
export(String) var Suit
export(String) var _Color
export(int) var Frame


func _ready():
	var random = randi()% 53 + 1
	$Sprite.frame = random


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		var random = randi()% 53 + 1
		$Sprite.frame = random
		print("Cards NOT removed, changed card sprites...\n")
