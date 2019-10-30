# card.gd
extends Node2D

export var card_name: String
export var value: int
export var suit: String
export var active: bool
export var face_sprite: Texture
export var back_sprite: Texture

signal activated
signal flipped


func _init() -> void:
	pass


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		var random = randi()% 53 + 1
		$Sprite.frame = random
		print("Cards NOT removed, changed card sprites...\n")


func init_data(_card_name:String, _value:int, _active:bool):
	card_name = _card_name
	value = _value
	active = _active


func set_sprites(_face_sprite:Texture, _back_sprite:Texture):
	face_sprite = _face_sprite
	back_sprite = _back_sprite

