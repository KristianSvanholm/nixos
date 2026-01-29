{pkgs, ...}: {
  programs.niri = {
    enable = true;
    useNautilus = true;
  };

  environment.systemPackages = with pkgs; [nautilus];
  programs.nautilus-open-any-terminal.enable = true;
}
