{ config, pkgs, lib, ... }:

{
  home.packages = [
    # general packages
    pkgs.teams-for-linux
    
    # platform CLIs
    (pkgs.azure-cli.withExtensions [ pkgs.azure-cli.extensions.aks-preview ])   
    pkgs.awscli2

    # others
    pkgs.kubelogin
  ];

  home.file = {

  };

  home.sessionVariables = {

  };
}
