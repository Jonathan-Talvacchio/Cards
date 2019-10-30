# blackjack.gd
extends Node

signal game_started
signal game_ended

const DECKDATA = preload("res://blackjack_deck.tres")

var addedChildren = []
var all_cards: Array = []
export var player_hand: Array = []
export var computer_hand: Array = []
#var selected_deck := 0

export(PackedScene) var cardScene
#export var number_of_decks := 1
export(int) var number


func _ready():
	DECKDATA.add_deck(DECKDATA.number_of_decks)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		$StartTimer.start()
		print("Timer Started!")
		print("Time left: %s seconds \n" % [$StartTimer.time_left])
	
	if Input.is_action_just_pressed("ui_accept"):
		removeCards()
		initCards()
		print("Cards removed and respawned...\n")

	if Input.is_action_just_pressed("ui_right"):
		removeCards()
		print("Cards removed...\n")
#		initCards()


func game_start():
	#get_cards
	#set_cards
	pass


func set_hand(hand: Array):
	pass


# --Remove all cards in scene--
func removeCards():
	if addedChildren.size() > 0:
		for i in addedChildren:
#			i.free()
			remove_child(i)


# --Spawn cards into scene
func initCards():
	for i in number:
		var half = 0.75
#		half += i
		var si = cardScene.instance()
		var w_s = OS.window_size
		print(OS.window_size)
		print(get_viewport().size)
		si.position = Vector2(w_s.x/2, w_s.y/2)
		add_child(si)
		addedChildren.append(si)


# --StartTimer Signal--
func _on_StartTimer_timeout():
	removeCards()
	initCards()
	$StartTimer.stop()
	print("Timer Stoped!\n")

