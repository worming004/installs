tools:
    ansible-playbook tools.yml --ask-become-pass -i inventory.ini

desktop:
    ansible-playbook desktop.yml --ask-become-pass -i inventory.ini

neovim:
    ansible-playbook neovim.yml --ask-become-pass -i inventory.ini

all:
    ansible-playbook tools.yml --ask-become-pass -i inventory.ini
    ansible-playbook desktop.yml --ask-become-pass -i inventory.ini
