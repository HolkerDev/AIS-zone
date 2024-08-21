extends Control

@export var i: int
@export var on_click_func: Callable
var inactive_texture: Texture = preload("res://assets/stage_icon.png")
var active_texture: Texture = preload("res://assets/stage_icon_active.png")

func init(stage_i: int, is_selected: bool, on_click: Callable):
	self.i = stage_i
	self.on_click_func = on_click
	self.position = Vector2(0, stage_i*100)
	set_selected(is_selected)
	set_active(is_selected)
	$StageIcon.connect("pressed", _on_clicked)

func _on_clicked():
	self.on_click_func.call(self.i)

func set_selected(state: bool):
	$StageSelector.visible = state

func set_active(is_active: bool):
	$StageIcon.texture_normal = active_texture if is_active else inactive_texture
