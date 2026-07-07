tools:
	ansible-playbook tools.yml --ask-become-pass --target inventory.ini
sway:
	ansible-playbook sway.yml --ask-become-pass --target inventory.ini

desktop:
	ansible-playbook desktop.yml --ask-become-pass --target inventory.ini

neovim:
	ansible-playbook neovim.yml --ask-become-pass --target inventory.ini

all:
	ansible-playbook tools.yml --ask-become-pass --target inventory.ini
	ansible-playbook desktop.yml --ask-become-pass --target inventory.ini
