{ config, pkgs, lib, ...}:

{
  home.packages = [
    
    # tools
    pkgs.bat
    pkgs.ripgrep
    pkgs.eza
    pkgs.tmux

    # icons
    pkgs.nerdfonts
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "$os$directory$git_branch$rust$python$lua$character";
      character = {
        success_symbol = "➜ ";
        error_symbol = "󰯈 ";
      };
      os = {
        symbols = {
          Alpine = " ";
          Arch = " ";
          Kali = " ";
          Linux = " ";
          Macos = " ";
          Raspbian = " ";
          Ubuntu = " ";
          Windows = "󰍲 ";
        };
      };
      directory = {
        read_only = " 󰌾";
      };
      git_branch = {
        symbol = " ";
      };
      lua = {
        symbol = " ";
      };
      python = {
        symbol = " ";
      };
      rust = {
        symbol = " ";
      };
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
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
