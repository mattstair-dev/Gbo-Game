extends Control

onready var scoreCounter = $scoreCounter

func _process(delta):
	scoreCounter.text = ":" + str(globalStats.score)
