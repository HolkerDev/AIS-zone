extends RichTextLabel


func _make_custom_tooltip(for_text):
	var label = preload("res://tooltip.tscn").instantiate()
	label.text = for_text
	return label
