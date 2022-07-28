sudo apt-get update
sudo apt-get -y install wget zip unzip bzip2
wget -q https://downloads.tuxfamily.org/godotengine/3.3/Godot_v3.3-stable_linux_headless.64.zip
unzip Godot_v3.3-stable_linux_headless.64.zip
mv Godot_v3.3-stable_linux_headless.64 godot
chmod +x godot
wget -q https://downloads.tuxfamily.org/godotengine/3.3/Godot_v3.3-stable_export_templates.tpz
mkdir -p ~/.local/share/godot/templates
unzip Godot_v3.3-stable_export_templates.tpz -d ~/.local/share/godot/templates
mv ~/.local/share/godot/templates/templates ~/.local/share/godot/templates/3.3.stable
mkdir win64
./godot --path project.godot --export win64 "win64/Mazerator.exe"
zip win64.zip win64/*
./godot --export macos --path project.godot "Mazerator-mac"
mv Mazerator-mac Mazerator-mac.zip
mkdir linux64
./godot --export linux64 --path project.godot "linux64/Mazerator.exe"
zip linux64.zip linux64/*
