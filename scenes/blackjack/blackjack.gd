extends Node

export(PackedScene) var cardScene
export(int) var number

var addedChildren = []
const c = preload("res://scenes/deck/deck_data.gd")
func _ready():
	var t = c.new()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		$StartTimer.start()
		print("Timer Started!")
		print("Time left: %s seconds \n" % [$StartTimer.time_left])
	
	if Input.is_action_just_pressed("ui_accept"):
		removeCards()
		initCards()
		print("Cards removed and respawned...\n")

	if Input.is_action_just_pressed("ui_right"):
		removeCards()
		print("Cards removed...\n")
#		initCards()


# --Remove all cards in scene--
func removeCards():
	if addedChildren.size() > 0:
		for i in addedChildren:
#			i.free()
			remove_child(i)


# --Spawn cards into scene
func initCards():
	for i in number:
		var half = 2
		half += i
		var si = cardScene.instance()
		si.position = Vector2(get_viewport().size.x/half, get_viewport().size.y/half)
		add_child(si)
		addedChildren.append(si)


# --StartTimer Signal--
func _on_StartTimer_timeout():
	removeCards()
	initCards()
	$StartTimer.stop()
	print("Timer Stoped!\n")
