{ config, pkgs, lib, ... }:

{
  home.packages = [
    # programmes
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.terraform
    pkgs.hurl
    pkgs.jq
    pkgs.bottom
    pkgs.k9s
    pkgs.lazygit
    pkgs.fd
    pkgs.xclip

    pkgs.docker
    pkgs.nodejs-slim
    pkgs.nodePackages.npm
    pkgs.luajitPackages.luarocks
    
    # languages
    pkgs.rustup
    ## Cargo
    pkgs.cargo-audit
    pkgs.cargo-nextest
    pkgs.cargo-udeps
    # pkgs.cargo-smart-release

    pkgs.uv
    pkgs.go
    pkgs.python3Full
    pkgs.lua
    pkgs.protobuf

    # tools and misc 
    pkgs.gcc
    pkgs.lld
    pkgs.mold
    pkgs.binutils

    # debuggers
    pkgs.vscode-extensions.vadimcn.vscode-lldb  
  ];

  home.file = {
  
  };

  home.sessionVariables = {
  
  };
  
  programs.git = {
    enable = true;
    userName = "Alix Macdonald";
    # defaultBranch = "main";
  };

  # nvim config is automatically read from ~/.config/nvim so you have to git clone into there first
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.activation.installCargoPackages = lib.hm.dag.entryAfter [ "writeBoundary" ] ''

    ${pkgs.rustup}/bin/rustup default stable
    ${pkgs.rustup}/bin/rustup toolchain install nightly
  '';
}
