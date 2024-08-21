extends Node2D

@onready var stage_item = preload("res://level_scene/stage_item.tscn")
@export var stage_controls: Array = []

func _ready():
	var stages = Global.get_stages(1)
	for i in stages.size():
		_add_stage_item(i, stages[i]["is_active"])
	_set_stage(stages.size()-1)

func _set_stage(i: int):
	var stages = Global.get_stages(1)
	$UI/StageUI/TextInputAction.text = "Осмотреться" if stages[i]["is_active"] else stages[i]["action"]
	$UI/StageUI/TextInputAction.editable = stages[i]["is_active"]
	$UI/StageUI/ButtonSubmit.disabled = not stages[i]["is_active"]
	$UI/StageUI/LabelResult.text = "(сперва выполните действия)" if stages[i]["is_active"] else stages[i]["result"]
	for child in $UI/StageList.get_children():
		child.set_selected(child.i == i)

func _on_submit():
	GlobalApiConnector.post_message($UI/StageUI/TextInputAction.text, _on_request_completed)

func _on_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var json = JSON.new()
		var response = JSON.parse_string(body.get_string_from_utf8())
		print(response)
		if not response.error_message:
			var messages = response['messages']
			var i = Global.save_stage(1, messages[1]['msg'], messages[0]['msg'])
			for child in $UI/StageList.get_children():
				child.set_active(child.i == i+1)  # next to the current one
			_add_stage_item(i+1, true)  # next to the current one
			_set_stage(i)
	else:
		Global.report_error("Error: %d" % response_code)

func _add_stage_item(i: int, is_active: bool):
	var stage_control = stage_item.instantiate()
	stage_control.init(i, is_active, _set_stage)
	$UI/StageList.add_child(stage_control)
