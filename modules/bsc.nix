{ config, pkgs, lib, ... }:

{
  home.packages = [
    # general packages
    # pkgs.intune-portal 
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
