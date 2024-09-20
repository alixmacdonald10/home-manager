{ config, pkgs, lib, ... }:

{
  home.packages = [
    pkgs.neofetch
    pkgs.firefox
  ];

  home.file = {

  };

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
  };
}
