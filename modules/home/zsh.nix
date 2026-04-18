{pkgs, ...}: {
  imports = [
    ./starship.nix
    ./tmux.nix
    ./eza.nix
    ./zoxide.nix
    ./btop.nix
    ./git.nix
    ./nvf.nix
    #./helix.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      #git
      ga = "git add";
      gc = "git commit -m";
      gcl = "git clone";
      gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
      gl = "git log --all --graph";
      gp = "git push";
      gr = "git reset";
      grs = "git restore";
      gs = "git status --short";
      gu = "git pull";

      switch = "sudo nixos-rebuild switch";
      test = "sudo nixos-rebuild test";
    };

    defaultKeymap = "viins";

    history = {
      size = 10000;
      ignoreDups = true;
    };
  };

  # General terminal packages here
  home.packages = with pkgs; [
    k9s
    just
    stow
    lf
    bat
    wget
    ripgrep
    gh
    rustup
    go
    duf # Better df
    ncdu # Better du
    progress # Monitor status of long-running commands
    lsof
    unp # unpack archive
    kubectl
    kubectx
    fluxcd
    kubernetes-helm
    dig
    terraform
  ];
}
