RELEASE=4.2.10

.PHONY:
image: Dockerfile
	docker build -t jrdasm/salix-playonlinux:${RELEASE} .

.PHONY:
install:
	@mkdir -p ~/.local/share/applications ~/.local/share/icons/hicolor/96x96/apps ~/.local/bin ~/.config
	@cp -v pol.desktop ~/.local/share/applications/
	@cp -v pol.png ~/.local/share/icons/hicolor/96x96/apps/
	@cp -v pol ~/.local/bin/
	@[ -n "$$XDG_CONFIG_DIR" ] || XDG_CONFIG_DIR=~/.config ; [ -e "$$XDG_CONFIG_DIR/pol.rc" ] || cp -v pol.rc $$XDG_CONFIG_DIR/
