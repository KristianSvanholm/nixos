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

      k = "kubectl";

      switch = "sudo nixos-rebuild switch";
      test = "sudo nixos-rebuild test";
      build = "sudo nixos-rebuild build";

      # remote switch; needs nix.settings.trusted-users on the target
      switch-hl0 = "nh os switch -H homelab-0 --target-host homelab-0";
      switch-hl1 = "nh os switch -H homelab-1 --target-host homelab-1";

      # build this host's system and push the closure to attic; needs `attic login homelab <url> <token>` once
      push-cache = "nix build --no-link --print-out-paths \"$NH_FLAKE#nixosConfigurations.$(hostname).config.system.build.toplevel\" | xargs attic push homelab:homelab";
    };

    defaultKeymap = "viins";

    history = {
      size = 10000;
      ignoreDups = true;
    };
  };

  # General terminal packages here
  home.packages = with pkgs; [
    attic-client
    k9s
    just
    stow
    terraform
    bat
    wget
    ripgrep
    gh
    rustup
    go
    lsof
    unp # unpack archive
    kubectl
    kubectx
    fluxcd
    kubernetes-helm
    dig
    ookla-speedtest
  ];
}
