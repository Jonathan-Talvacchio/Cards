# deckdata.gd
extends Resource

class_name DeckData

"""
build decks
and control card data
"""

#enum {CLUBS, DIAMONDS, HARTS, SPADES}
enum {TWO = 0, JACK = 9, QUEEN, KING, ACE = 12}

const CLUBS = "clubs"
const DIAMONDS = "diamonds"
const HEARTS = "hearts"
const SPADES = "spades"

const SUITS = [CLUBS, DIAMONDS, HEARTS, SPADES]

const DECK_SIZE = 52

var decks: Array = []
var selected_deck: int = 0

export var number_of_decks := 1
export var max_value: int = 10
export var min_value: int = 2


func add_deck(n: int = 1):
	var new_deck: Array = []
	
	# run for each in number_of_decks
	for deck_count in range(n):
		# deck variables
		var suit_index: int = 0
		var suit_build_position: int = 0
		
		# run once for each deck
		for deck_build_position in range(DECK_SIZE):
			# get new card (dictionary)
			var suit: String = SUITS[suit_index]
			var value: int = suit_build_position + 2
			
			var new_card = _create_card(suit, value, 0)
			new_card["SUIT_BUILD_POSITION"] = suit_build_position
			new_card["PARENT_DECK"] = deck_count
			new_deck.append(new_card)
			
			suit_build_position +=1
			
			if(suit_build_position > ACE):
				suit_build_position = TWO
				suit_index += 1
		
	decks.append(new_deck)


func rebuild_decks(n := 0):
	decks.clear()
	add_deck(n)


func _create_card(suit: String, value: int, set: int) -> Dictionary:
	var new_card: Dictionary = {}  # create dictionary
	
	var card_name = "%s_%s_%s" % [suit, value, set]
	# set sprite dictionary
	var face_sprite = load(
			"res://sprites/cards/set_0/faces/%s.png" % [card_name])
	
	# set values
	var clamped_value = int(clamp(value, min_value, max_value))
	new_card["SUIT"] = suit
	new_card["VALUE"] = clamped_value
	new_card["FACE_UP"] = false
	new_card["BACK_SPRITE"] = false
	new_card["FACE_SPRITE"] = face_sprite
	new_card["BACK_SPRITE"] = null
	
	#return new card dictionary
	return new_card


func flip_card(card: Dictionary):
	if (card.FACE_UP == true):
		card["FACE_UP"] = false
	else:
		card["FACE_UP"] = true
	return card


func destroy_card(current_deck, index):
	current_deck.remove(index)


func pull_card(deck: Array):
	deck.shuffle()
	var selected_card: Dictionary = deck.front()
	
	# if card is active pick again
	if selected_card["ACTIVE"]:
		# keep picking until selected card in not active
		while selected_card["ACTIVE"]:
			deck.shuffle()
			selected_card = deck.front()
	
	selected_card["ACTIVE"] = true
	return selected_card


func return_card(card: Dictionary):
	card["ACTIVE"] = false

