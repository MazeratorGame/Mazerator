extends Node

var config = ConfigFile.new()
var err = config.load("user://video.cfg")
# nmf stands for Nearest Mipmap Filter
var nmf = config.get_value("nmf", "value", false)
var msaa = config.get_value("msaa", "x", 0)
var dss = config.get_value("dss", "size", 4096)
var sas = config.get_value("sas", "size", 4096)
var ssq = config.get_value("ssq", "quality", 1)
var fs = config.get_value("fs", "value", false)
var hd = config.get_value("hd", "reflections", false)
var hdr = config.get_value("hd", "hdr", true)
var fo = config.get_value("fo", "value", true)
var screen_width = config.get_value("screen_size", "width", 1024)
var screen_height = config.get_value("screen_size", "height", 600)
var fullscreen = config.get_value("screen_size", "fullscreen", false)

func _init():
	if err == OK:
		config.save("user://video.cfg")
		ProjectSettings.set_setting("rendering/quality/filters/use_neares_mipmap_filter", nmf)
		ProjectSettings.set_setting("rendering/quality/filters/msaa", msaa)
		ProjectSettings.set_setting("rendering/quality/directional_shadow/size", dss)
		ProjectSettings.set_setting("rendering/quality/shadow_atlas/size", sas)
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/quality", ssq)
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/follow_surface", fs)
		ProjectSettings.set_setting("rendering/quality/voxel_cone_tracing/high_quality", hd)
		ProjectSettings.set_setting("rendering/quality/depth/hdr", hdr)
		ProjectSettings.set_setting("rendering/quality/dynaimc_fonts/use_oversampling", fo)
		ProjectSettings.set_setting("display/window/size/width", screen_width)
		ProjectSettings.set_setting("display/window/size/height", screen_height)
		ProjectSettings.set_setting("display/window/size/fullscreen", fullscreen)
			
	else:
		config.save("user://video.cfg")
		err = config.load("user://video.cfg")

func _on_Button_pressed():
	if err == OK:
		if nmf == false:
			nmf = true
			$Button.text = "Nearest Mipmap Filter (NMF): On"
		else:
			nmf = false
			$Button.text = "Nearest Mipmap Filter (NMF): Off"
			
		config.set_value("nmf", "value", nmf)
		ProjectSettings.set_setting("rendering/quality/filters/use_neares_mipmap_filter", nmf)
		config.save("user://video.cfg")


func _on_Button2_pressed():
	if err == OK:
		if msaa == 0:
			msaa = 2
			$Button2.text = "MSAA: 2x"
		elif msaa == 2:
			msaa = 4
			$Button2.text = "MSAA: 4x"
		elif msaa == 4:
			msaa = 8
			$Button2.text = "MSAA: 8x"
		elif msaa == 8:
			msaa = 16
			$Button2.text = "MSAA: 16x"
		else:
			msaa = 0
			$Button2.text = "MSAA: Off"
			
		config.set_value("msaa", "x", msaa)
		ProjectSettings.set_setting("rendering/quality/filters/msaa", msaa)
		config.save("user://video.cfg")


func _on_Video_Settings_ready():
	if nmf == true:
			$Button.text = "Nearest Mipmap Filter (NMF): On"
			
	if msaa == 2:
		$Button2.text = "MSAA: 2x"
	elif msaa == 4:
		$Button2.text = "MSAA: 4x"
	elif msaa == 8:
		$Button2.text = "MSAA: 8x"
	elif msaa == 16:
		$Button2.text = "MSAA: 16x"
	
	$TextEdit.text = str(dss)


func _on_TextEdit_text_changed():
	dss = int($TextEdit.text)
	config.set_value("dss", "size", dss)
	ProjectSettings.set_setting("rendering/quality/directional_shadow/size", dss)


func _on_TextEdit2_text_changed():
	pass # Replace with function body.
