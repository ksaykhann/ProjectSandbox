extends Node
class_name Deck

enum type {
	FOOL,
	POKER,
	GOAT,
}

static var value_array : Array[String] = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
static var suit_array : Array[String] = ["Hearts", "Spades", "Diamonds", "Clubs"]

static var goat_idx: Array[int] = [4, 8, 9, 10, 11, 12]

func bulid(deck: type) -> Array[Array]:
	var deck_type
	var cards_array :Array[Array] = []
	match deck:
		type.FOOL:
			deck_type = value_array.slice(4)
		type.GOAT:
			deck_type = goat_idx.map(func (i): return value_array[i])
		_:
			deck_type = value_array
			
	for value in deck_type:
		for suit in suit_array:
			var card = []
			card.append(value)
			card.append(suit)
			cards_array.append(card)
	
	return cards_array
