{ config, pkgs, lib, ...}:

{
  home.packages = [
    
    # tools
    pkgs.bat
    pkgs.ripgrep
    pkgs.eza
    pkgs.tmuxinator
    pkgs.libnotify

    # icons
    pkgs.nerdfonts
  ];

  programs.alacritty = {
    enable = true;
  };

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

  programs.zoxide = {
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
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    tmuxinator = {
      enable = true;
    }; 
    mouse = true;
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"

      set -g status-position top

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix
      
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      
      set -g @catppuccin_window_left_separator "█"
      set -g @catppuccin_window_right_separator "█ "
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_middle_separator "  █"

      set -g @catppuccin_window_default_fill "number"

      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#{pane_current_path}"

      set -g @catppuccin_status_modules_right "application session date_time"
      set -g @catppuccin_status_left_separator  ""
      set -g @catppuccin_status_right_separator " "
      set -g @catppuccin_status_fill "all"
      set -g @catppuccin_status_connect_separator "yes"

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
      cd = "z";
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
        { name = "MichaelAquilina/zsh-autoswitch-virtualenv"; }
        { name = "MichaelAquilina/zsh-auto-notify"; }
        { name = "jeffreytse/zsh-vi-mode"; }
      ];
    };
  };

}
