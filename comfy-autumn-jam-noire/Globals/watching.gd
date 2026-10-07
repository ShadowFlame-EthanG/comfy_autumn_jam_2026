extends Node

signal isSeen
signal changeTime

func i_see_you():
	isSeen.emit()

func i_can_change():
	changeTime.emit()
