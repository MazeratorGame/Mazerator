extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://Level1/Level1.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Settings/Settings.tscn")
