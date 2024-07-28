extends Label

@onready var cost = 0
	

func change_cost(new_state: bool, change: int):
	self.cost += change if new_state else -change
	self.text = str(self.cost)

