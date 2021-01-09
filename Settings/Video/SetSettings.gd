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
		ProjectSettings.set_setting("display/window/size/test_width", screen_width)
		ProjectSettings.set_setting("display/window/size/test_height", screen_height)
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
	$TextEdit2.text = str(sas)
	
	if ssq == 1:
		$Button3.text = "Subsurface Scattering quality: Medium"
	elif ssq == 2:
		$Button3.text = "Subsurface Scattering quality: High"
	elif ssq == 0:
			$Button3.text = "Subsurface Scattering quality: Low"


func _on_TextEdit_text_changed():
	dss = int($TextEdit.text)
	config.set_value("dss", "size", dss)
	ProjectSettings.set_setting("rendering/quality/directional_shadow/size", dss)


func _on_TextEdit2_text_changed():
	sas = int($TextEdit2.text)
	config.set_value("sas", "size", 4096)
	ProjectSettings.set_setting("rendering/quality/shadow_atlas/size", sas)


func _on_Button3_pressed():
	if ssq == 1:
		ssq = 2
		$Button3.text = "Subsurface Scattering quality: High"
	elif ssq == 2:
		ssq = 0
		$Button3.text = "Subsurface Scattering quality: Low"
	elif ssq == 0:
		ssq = 1
		$Button3.text = "Subsurface Scattering quality: Medium"
		
	config.set_value("ssq", "quality", ssq)
	ProjectSettings.set_setting("rendering/quality/subsurface_scattering/quality", ssq)
	config.save("user://video.cfg")


func _on_Button4_pressed():
	if fs == false:
			fs = true
			$Button4.text = "Follow Surface: On"
	else:
		fs = false
		$Button4.text = "Follow Surface: Off"
			
	config.set_value("fs", "value", fs)
	ProjectSettings.set_setting("rendering/quality/subsurface_scattering/follow_surface", fs)
	config.save("user://video.cfg")


func _on_Button5_pressed():
	if hd == false:
		hd = true
		$Button5.text = "HD Reflections: On"
	else:
		hd = false
		$Button5.text = "HD Reflections: Off"
			
	config.set_value("hd", "reflections", hd)
	ProjectSettings.set_setting("rendering/quality/voxel_cone_tracing/high_quality", hd)
	config.save("user://video.cfg")


func _on_Button6_pressed():
	if hdr == false:
		hdr = true
		$Button6.text = "HDR: On"
	else:
		hdr = false
		$Button6.text = "HDR: Off"
			
	config.set_value("hd", "hdr", hdr)
	ProjectSettings.set_setting("rendering/quality/depth/hdr", hdr)
	config.save("user://video.cfg")


func _on_Button7_pressed():
	if fo == false:
		fo = true
		$Button7.text = "Font Oversampling: On"
	else:
		fo = false
		$Button7.text = "Font Oversampling: Off"
			
	config.set_value("fo", "value", fo)
	ProjectSettings.set_setting("rendering/quality/dynaimc_fonts/use_oversampling", fo)
	config.save("user://video.cfg")


func _on_Button8_pressed():
	screen_width = int($TextEdit3.text)
	screen_height = int($TextEdit4.text)
	ProjectSettings.set_setting("display/window/size/width", screen_width)
	ProjectSettings.set_setting("display/window/size/height", screen_height)
	config.set_value("screen_size", "width", screen_width)
	config.set_value("screen_size", "height", screen_height)
	config.save("user://video.cfg")
