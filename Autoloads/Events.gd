extends Node

enum STATES { Game, StartScreen, InputObject, Check }

signal location_changed(location: STATES)
signal room_changed(room: String)
signal side_changed(where: int)
