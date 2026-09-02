@tool
extends Control

@onready var card := $White
@onready var topside := $White/TopSide
@onready var grid := $White/TopSide/SuitContainer
@onready var label := $White/Label
@onready var texture_rect := $White/TextureRect

@export var rank : String = "2":
	set(value):
		_rank = value
		if label:
			set_suits()
	get():
		return _rank
		
@export var suit : CompressedTexture2D = load("res://mechanics/tabletop/card_games_asset/hearts.png"):
	set(value):
		_suit = value
		if label:
			set_suits()
	get():
		return _suit
		
@onready var cells := grid.get_children()

var _rank: String
var _suit: CompressedTexture2D
var _label2: Label
var _texture_rect2: TextureRect

#ряд 0: [0] [1] [2]
#ряд 1: [3] [4] [5]
#ряд 2: [6] [7] [8]
#ряд 3: [9] [10][11]
#ряд 4: [12][13][14]
#ряд 5: [15][16][17]

const PIPS :={
	"2": [1, 16],
	"3": [1, 7, 16],
	"4": [0, 2, 15, 17],
	"5": [0, 2, 7, 15, 17],
	"6": [0, 2, 4, 13, 15, 17],
	"7": [0, 2, 4, 6, 8, 15, 17],
	"8": [0, 2, 4, 6, 8, 13, 15, 17],
	"9": [0, 2, 3, 5, 7, 12, 14, 15, 17],
	"10": [0, 2, 4, 6, 8, 9, 11, 13, 15, 17]
}

func _ready() -> void:
	suit = _suit
	rank = _rank

func set_suits() -> void:
	label.text = _rank
	texture_rect.texture = _suit
	if _label2:
		_label2.queue_free()
	if _texture_rect2:
		_texture_rect2.queue_free()
		
	_label2 = label.duplicate()
	card.add_child(_label2)
	_label2.rotation_degrees = 180
	_label2.position = Vector2(94, 146)
	
	_texture_rect2 = texture_rect.duplicate()
	card.add_child(_texture_rect2)
	_texture_rect2.texture = suit
	_texture_rect2.rotation_degrees = 180
	_texture_rect2.position = Vector2(90, 120)
	for c in cells:
		c.texture = null
		
	if rank in ["J", "Q", "K"]:
		show_court_card()
		return
		
	if rank == "A":
		show_ace()
		return

	var indices = PIPS.get(_rank, [])
	for i in indices:
		cells[i].texture = _suit
		if i >= 9:
			cells[i].flip_v = true
	
func show_court_card() -> void:
	pass

func show_ace() -> void:
	pass
