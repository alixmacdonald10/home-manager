{ config, pkgs, lib, ... }:

{
  home.packages = [
    # general packages
    # pkgs.intune-portal 
    # platform CLIs
    (pkgs.azure-cli.withExtensions [ pkgs.azure-cli.extensions.aks-preview pkgs.azure-cli.extensions.storage-preview ])   
    pkgs.azure-storage-azcopy  
    pkgs.awscli2

    # others
    pkgs.kubelogin
  ];

  home.file = {

  };

  home.sessionVariables = {

  };
}
