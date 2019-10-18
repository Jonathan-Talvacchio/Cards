extends Resource

enum {CLUBS, DIAMONDS, HARTS, SPADES}
enum {TWO = 0, JACK = 9, QUEEN, KING, ACE = 12}

const DECK_SIZE := 52
var deck_dictionary := {}

class cd : public Object{
	
}
	var card
	func _init(sd: Array):
		card = sd

func _init():
	add_deck()
#	print(deck_dictionary["BLACKJACK"])
	cd.new(deck_dictionary[1])
	print(cd.card)
	for i in deck_dictionary["BLACKJACK"]:
		print(i)


func add_deck(n := 1):
	var new_deck := []
	var deck_count := 0
	while deck_count < n:
		var suit := CLUBS
		var suit_index := 0
		var value := 2
		var build_position := 0
		
		while build_position < DECK_SIZE:
			#get new card (dictionary)
			var new_card = create_card(suit, clamp(value, 2, 10))
			new_card["SUIT_INDEX"] = suit_index
			new_deck.append(new_card)
#			new_card["DECK_INDEX"] = build_position
			
			build_position += 1
			suit_index +=1
			value += 1
			if(suit_index > ACE):
				suit_index = TWO
				value = 2
				suit += 1
		deck_count += 1
	deck_dictionary["BLACKJACK"] = new_deck


func create_card(suit: int, value: int) -> Dictionary:
	var new_card: Dictionary = {}  # create dictionary
	# set values
	new_card["SUIT"] = suit
	new_card["VALUE"] = value
	new_card["FACE_UP"] = false
	
	#return new card dictionary
	return new_card


func flip_card(card: Dictionary):
	if (card.FACE_UP == true):
		card.FACE_UP = false
	else:
		card.FACE_UP = true


func destroy_card(current_deck, index):
	current_deck.remove(index)

