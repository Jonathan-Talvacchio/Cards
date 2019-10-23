# Card.gd
extends Node2D

class_name Card

export var Name:String
export var Value:int
export var Suit:String
export var _Color:String
export var Frame:int
export var IsActave:bool

signal activated
signal flipped


func _init() -> void:
	pass


func _ready():
	var random = randi()% 53 + 1
	$Sprite.frame = random


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		var random = randi()% 53 + 1
		$Sprite.frame = random
		print("Cards NOT removed, changed card sprites...\n")

