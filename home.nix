{ config, pkgs, ... }:

{
  home.username = "amac";
  home.homeDirectory = "/home/amac";

  targets.genericLinux.enable = true;
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.neofetch
    
    # browser
    pkgs.firefox-devedition

    # essential tooling
          
    # peripheral management

  ];

  home.file = {
  
  };

  home.sessionVariables = {
  
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
