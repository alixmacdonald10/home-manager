{ config, pkgs, lib, ... }:

{
  home.packages = [
    pkgs.neofetch
    pkgs.flameshot
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    
  };

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
  };

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Flameshot HM";
      command = "sh -c 'QT_QPA_PLATFORM=wayland ${pkgs.flameshot}/bin/flameshot gui'";
      binding = "Print";
    };      
  };
}
