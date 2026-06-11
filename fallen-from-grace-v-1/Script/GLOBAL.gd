extends Node
@onready var level: Node = $"."
var protogun_DMG = 10
var player_max_health = 100
var player_health = player_max_health
var BA = 1:
	set(value):
		BA = clamp(value,0,1)
var starting_BA = 100
var enemy_count = null
var starting_enemy_count = 2
