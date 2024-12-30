extends Node

enum STATES { Game, StartScreen, ListOfTenants, Check }

signal location_changed(location: STATES)
signal room_changed(room: String)
signal side_changed(where: int)
