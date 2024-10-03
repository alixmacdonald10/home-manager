# Getting started

This repo houses the home manager config. This only works for Linux systems.

Once created this repo can be used to declaritively configure your packages installed on your system. It provides a number of standalone modules in the `modules/` directory. Each module defines packages and setup. The `home.nix` and `flake.lock` are bespoke to each system.

1. Install `curl` using your default package manager, this will be replaced by the home-manager installed curl later.
1. Install `nix` package manager with: `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`
1. Use nix to install home-manager with: `nix run home-manager/master -- init --switch`
1. Navigate to `~/.config/home-manager` and update the user fields in `flake.nix` and `home.nix` to be your current username.
1. Clone the contents of this repository into the `~/.config/home-manager` directory 
1. Add the desired nix files defined in the modules directory or update existing modules as neccesary to define your chosen config. Update the `flake.nix` to include your user and your chosen modules and update the `home.nix` to include your desired modules for your specific hardward/user.
1. update your config as required by running: `home-manager switch`


[NOTE!]
- All available nix packages can be found here: https://search.nixos.org/packages?channel=24.05&from=0&size=50&sort=relevance&type=packages&query=firefox+dev+extension
- Configuration options for these packages can be found here (for home-manager): https://home-manager-options.extranix.com/

# Finishing up
## Ubuntu
- Set up you default shell to zsh by adding `/home/USER/.nix-profile/bin/zsh` as a line to `/etc/shells.ith` then running: `chsh -s $(which zsh)`
- There may be permissions issues which occur however these can generally be fixed by adding your `USER` to the appropriate `GROUP`
- remove curl from your system as it will now be managed by home-manager
- remove openssl from your system as it will now be managed by home-manager

### Docker
There are currently issues installing docker on non NixOS https://github.com/NixOS/nixpkgs/issues/70407. To alleviate this install docker daemon manually. 
To run docker non sudo create a docker group with: `sudo groupadd docker` then add your user with: `sudo usermod -aG docker $(whoami)`. Log out and back in then run: `newgrp docker` then run: `groups`. You should see docker under the groups your user is a member of. Set docker to start automatically with: `sudo systemctl enable docker.service`

## Git
Create your git SSH keys as required and add them to your ssh-agent.

libsecret will be used to store and manage git https credentials. This happens automatically when you put enter the password the first time.

