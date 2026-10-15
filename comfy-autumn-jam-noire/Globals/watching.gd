extends Node

signal isSeen(names: Array[Node3D])
signal changeTime

func i_see_you(hname):
	isSeen.emit(hname)

func i_can_change():
	changeTime.emit()
