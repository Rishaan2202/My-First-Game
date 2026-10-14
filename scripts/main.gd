extends Node
@onready var sound = $AudioStreamPlayer2D
@onready var level_1: Node2D = $LevelRoot
@onready var score_label: Label = $Score/ScorePanel/ScoreLabel

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_connect_apples()
	score_label.text = "SCORE: %s " % score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _connect_apples() -> void:
	var apples = get_tree().get_nodes_in_group("apples")
	for apple_node in get_tree().get_nodes_in_group("apples"):
		if apple_node.has_signal("apple_gained"):
			apple_node.apple_gained.connect(handle_score_display.bind(apple_node))
		
func handle_score_display(apple_node) -> void:
	
	print("SIGNAL RECEVED TO UPDATE THE SCORE")
	
	if apple_node.has_method("collected"):
		apple_node.collected()
	
	score += 1
	score_label.text = "SCORE: %s" % score 
