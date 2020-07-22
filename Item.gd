extends Area2D

signal pickup

func _on_Item_body_entered(body):
	emit_signal("pickup")
	queue_free()
	globalStats.incScore()
