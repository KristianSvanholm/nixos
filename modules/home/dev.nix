{pkgs, ...}: {
  imports = [
    ./starship.nix
    ./eza.nix
    ./zoxide.nix
    ./vim/languages.nix
    #./helix.nix
  ];

  programs.zsh.shellAliases = {
    switch = "sudo nixos-rebuild switch";
    test = "sudo nixos-rebuild test";
    build = "sudo nixos-rebuild build";

    # remote switch; needs nix.settings.trusted-users on the target
    switch-hl0 = "nh os switch -H homelab-0 --target-host homelab-0";
    switch-hl1 = "nh os switch -H homelab-1 --target-host homelab-1";
    switch-pi = "nh os switch -H adguard-pi --target-host krs@adguard-pi";
  };

  home.packages = with pkgs; [
    k9s
    just
    stow
    terraform
    bat
    gh
    rustup
    go
    unp # unpack archive
    kubectl
    kubectx
    fluxcd
    kubernetes-helm
    ookla-speedtest
  ];
}
