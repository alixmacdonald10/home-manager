{
  description = "Home Manager configuration of amac";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        config.allowUnfree = true; 
        inherit system;
      };
    in {
      homeConfigurations."amac" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./home.nix
      	  ./modules/shell.nix
      	  ./modules/dev.nix
	        ./modules/bsc.nix
	      ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
