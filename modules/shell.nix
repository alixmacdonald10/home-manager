{ config, pkgs, lib, ...}:

{
  home.packages = [
    
    # tools
    pkgs.fzf
    pkgs.bat
    pkgs.ripgrep
    pkgs.starship
    pkgs.eza
    pkgs.tmux

    # icons
    pkgs.nerdfonts
  ];

  home.file = {
  
  };

  home.sessionVariables = {

  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza -l";
      cat = "bat";
    };
    syntaxHighlighting = {
      enable = true;
    };
    enableCompletion = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
      ];
    };
  };

}
