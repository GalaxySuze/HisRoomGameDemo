extends "res://scenes/game/Scene.gd"


@onready var dustbin = %Dustbin
@onready var bookshelf = %Bookshelf
@onready var poster = $Poster
@onready var clock = $Clock
@onready var you_xi_wang = $YouXiWang
@onready var gameboy = $Gameboy
@onready var slippers = $Slippers
@onready var photo_album = $PhotoAlbum
@onready var scallion = $Scallion
@onready var recorder = $Recorder
@onready var umbrella = $Umbrella
@onready var carpet = $Carpet
@onready var sofa = $Sofa
@onready var tissue = $Tissue


func _ready():
	for prop in [dustbin,bookshelf,poster,clock,you_xi_wang,gameboy,slippers,
	photo_album,scallion,recorder,umbrella,carpet,sofa,tissue]:
		prop.interact.connect(
			_on_prop_interact.bind(prop.dialogue_res, prop.dialogue_start))


func _on_prop_interact(res:DialogueResource, start:String):
	SoundManager.play_sfx(SoundManager.SFX_PRESSED)
	var balloon := Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(res, start)
