extends Node

signal isSeen(names: Array[Node3D])
signal changeTime

func i_see_you(name):
	isSeen.emit(name)

func i_can_change():
	changeTime.emit()
