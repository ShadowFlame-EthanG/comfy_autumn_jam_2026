extends Node

var prev_mouse
var curr_mouse

var prev_camera
var prev_head

signal highlighted(h_name: String)
signal gone()

signal open_newspaper
signal open_files
signal open_notes
signal gun_choice
signal drink_coffee
signal fill_coffee
signal coffee_empty

func newspaper_selected() -> void:
	open_newspaper.emit()

func files_selected() -> void:
	open_files.emit()

func notes_selected() -> void:
	open_notes.emit()
	
func make_choice() -> void:
	gun_choice.emit()
	
func coffee_drank() -> void:
	drink_coffee.emit()

func order_coffee() -> void:
	fill_coffee.emit()

func no_coffee() -> void:
	coffee_empty.emit()
