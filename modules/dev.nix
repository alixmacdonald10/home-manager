{ config, pkgs, lib, ... }:

{
  home.packages = [
    # programmes
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.istioctl
    pkgs.tenv  # terraform/opentofu 
    pkgs.hurl
    pkgs.jq
    pkgs.bottom
    pkgs.k9s
    pkgs.lazygit
    pkgs.fd
    pkgs.xclip
    pkgs.curl  
    pkgs.grpcurl
    pkgs.dust  # drive usage
    pkgs.silicon
    pkgs.trivy
    pkgs.gitleaks
    pkgs.nmap
    pkgs.mitmproxy
    pkgs.gnuplot
    pkgs.yazi  #file browser
    pkgs.yarn 
    pkgs.k3d
    pkgs.mermaid-cli  # render mermaid diags
    pkgs.plantuml  # render plantuml diags

    # pkgs.docker
    # pkgs.docker-buildx
    pkgs.lazydocker
    pkgs.nodejs-slim
    pkgs.nodePackages.npm
    
    # languages
    pkgs.rustup
    ## Cargo
    pkgs.cargo-audit
    pkgs.cargo-nextest
    pkgs.cargo-udeps
    pkgs.cargo-wipe
    pkgs.cargo-expand
    pkgs.bacon
    # pkgs.cargo-smart-release -> unavailable on nix pkgs currently manually install with cargo
    
    pkgs.valgrind
    pkgs.just 

    pkgs.uv
    pkgs.go
    pkgs.python3Full
    pkgs.lua51Packages.lua
    pkgs.luajitPackages.luarocks
    pkgs.protobuf

    # tools and misc 
    pkgs.openssl
    pkgs.openssl.dev
    pkgs.pkg-config
    pkgs.zlib
    pkgs.gcc
    pkgs.gnumake
    pkgs.cmake
    # pkgs.lld
    pkgs.mold
    pkgs.binutils
    pkgs.asciinema
    pkgs.asciinema-agg

    # debuggers
    pkgs.vscode-extensions.vadimcn.vscode-lldb  
  ];

  home.file = {
  
  };

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    
    # enables checking and signing of docker images handled automagically by docker
    DOCKER_CONTENT_TRUST = 0; 
  };

  programs.git = {
    package = pkgs.gitFull;
    enable = true;
    userName = "Alix Macdonald";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      credential = {
        helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
      };
    };
  };

  # nvim config is automatically read from ~/.config/nvim so you have to git clone into there first
  programs.neovim = {
     enable = true;
     package = pkgs.neovim;
     extraLuaPackages = ps: [ ps.magick ];
     extraPackages = [ pkgs.imagemagick ]; 
     defaultEditor = true;
     viAlias = true;
     vimAlias = true;
     vimdiffAlias = true;
  };

  home.activation.installCargoPackages = lib.hm.dag.entryAfter [ "writeBoundary" ] ''

    ${pkgs.rustup}/bin/rustup default stable
    ${pkgs.rustup}/bin/rustup toolchain install nightly
    ${pkgs.rustup}/bin/rustup component add rust-analyzer
  '';
}
