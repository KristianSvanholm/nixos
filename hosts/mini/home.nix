{pkgs, ...}: {
  imports = [
    ../home.nix
    ../../modules/home/common.nix
    ../../modules/home/noctalia
    ../../modules/home/gtk.nix
    ../../modules/home/ghostty.nix
  ];

  git.opSSHKey = true;
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings."*" = {
        IdentityAgent = "~/.1password/agent.sock";
      };
    };
  };

  services.mpris-proxy.enable = true;
  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    prismlauncher
    jotta-cli
    nitch
    opencode
    claude-code
    winboat
  ];
}
