{pkgs, ...}: {
  imports = [
    ./tmux.nix
    ./btop.nix
    ./git.nix
    ./vim
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
    };

    defaultKeymap = "viins";

    history = {
      size = 10000;
      ignoreDups = true;
    };
  };

  home.packages = with pkgs; [
    wget
    lsof
    dig
  ];
}
