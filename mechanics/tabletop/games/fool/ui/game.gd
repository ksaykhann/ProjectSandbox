extends Control

var deck_builder: Deck = Deck.new()
var cards : Array[Array]
func _ready() -> void:
	cards = deck_builder.bulid(deck_builder.type.FOOL)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	cards.shuffle()
	print(cards)
