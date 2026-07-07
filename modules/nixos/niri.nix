{pkgs, ...}: {
  programs.niri = {
    enable = true;
    useNautilus = true;
  };

  environment.systemPackages = [pkgs.xwayland-satellite];
}
