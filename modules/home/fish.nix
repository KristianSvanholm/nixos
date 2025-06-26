{pkgs, ...}: {
  imports = [
    ./tmux.nix
    ./eza.nix
    ./zoxide.nix
    ./btop.nix
    ./git.nix
    ./nvf.nix
  ];

  programs.fish = {
    enable = true;
    /*
      shellInit = "
      set -l nix_shell_info (
        if test -n \"$IN_NIX_SHELL\"
          echo -n \"<nix-shell> \"
        end
      )
    ";
    */
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

      # ping -c 1 [ip] && arp -n, to find mac addr
      wake = "wakeonlan -i 192.168.3.112 6c:2b:59:cf:cf:50";
      switch = "sudo nixos-rebuild switch";
      test = "sudo nixos-rebuild test";

      # For mc server
      tmc = "sudo tmux -S /run/minecraft/winter-gaming.sock attach";
      mcstart = "systemctl start minecraft-server-winter-gaming.service";
      mcstop = "systemctl stop minecraft-server-winter-gaming.service";
    };
  };

  # General terminal packages here
  home.packages = with pkgs; [
    stow
    lf
    bat
    fzf
    unzip
    wget
    ripgrep
    gh
    rustup
    go
    sesh
    duf # Better df
    ncdu # Better du
    progress # Monitor status of long-running commands
    lsof
    unp # unpack archive
    asciinema # Record terminal
    asciinema-agg # Convert Ascii record to gif
    ncspot
  ];
}
