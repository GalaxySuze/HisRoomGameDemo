extends Node

@onready var bgm_player = $BgmPlayer
@onready var sfx_player = $SfxPlayer


@export_file("*.mp3") var def_bgm
@export_file("*.wav") var pressed_sfx
@export_file("*.wav") var hover_sfx


const SFX_PRESSED = 0
const SFX_HOVER = 1


func play_music(path:String = ""):
	# 如果不传音乐资源路径,直接播放默认背景音乐
	if path == "" :
		path = def_bgm
	
	if bgm_player.playing && bgm_player.stream.resource_path == path:
		return
		
	bgm_player.stream = load(path)
	bgm_player.play()


func play_sfx(action:int):
	if sfx_player.playing:
		return
	
	if action == SFX_PRESSED:
		sfx_player.stream = load(pressed_sfx)
		sfx_player.play()
		
	if action == SFX_HOVER:
		sfx_player.stream = load(hover_sfx)
		sfx_player.play()
		
		
func bind_btn_sfx(btns:Array):
	for btn in btns:
		btn.pressed.connect(_on_btn_pressed)
		
		
func _on_btn_pressed():
	play_sfx(SoundManager.SFX_PRESSED)

