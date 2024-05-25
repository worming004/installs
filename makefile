tools:
	ansible-playbook tools.yml --ask-become-pass
sway:
	ansible-playbook sway.yml --ask-become-pass

desktop:
	ansible-playbook desktop.yml --ask-become-pass

neovim:
	ansible-playbook neovim.yml --ask-become-pass

all:
	ansible-playbook tools.yml --ask-become-pass
	ansible-playbook desktop.yml --ask-become-pass
