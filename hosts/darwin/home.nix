{pkgs, ...}: {
  imports = [
    ../../modules/home/zsh.nix
    ../../modules/darwin/alacritty.nix
    ../config.nix
  ];

  user.home = "/Users/krs";

  home.sessionVariables = {};

  git.email = "kristian-roren.svanholm@gjensidige.no";
  git.opSSHKey = true;
  git.signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";

  programs = {
    ssh = {
      enable = true;
      extraConfig = ''
        Host *
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      '';
    };
    home-manager.enable = true; # Let Home Manager manage itself
  };

  home.packages = with pkgs; [_1password-cli];

  xdg.configFile."sketchybar" = {
    source = ../../config/sketchybar;
    recursive = true;
  };

  home.stateVersion = "24.05"; # Dont touch
}
