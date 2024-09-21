{ config, pkgs, lib, ... }:

{
  home.packages = [
    pkgs.steam
    pkgs.heroic
    pkgs.discord
    pkgs.obs-studio
  ];

  home.file = {

  };

  home.sessionVariables = {

  };
}
