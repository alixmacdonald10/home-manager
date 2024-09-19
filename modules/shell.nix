{ config, pkgs, lib, ...}:

{
  home.packages = [
    
    # tools
    pkgs.bat
    pkgs.ripgrep
    pkgs.eza

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

  programs.tmux = {
    enable = true;
    clock24 = true;
    sensibleOnTop = true;
    shell = "\${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    mouse = true;
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix
      
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.sensible;
      }
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
      }
      {
        plugin = tmuxPlugins.catppuccin;
      }
      {
        plugin = tmuxPlugins.yank;
      }
    ];
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
    autosuggestion = {
      enable = true;
    };
    history = {
      size = 5000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    zplug = {
      enable = true;
      plugins = [
         # auto suggestions
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-completions"; }
      ];
    };
  };

}
