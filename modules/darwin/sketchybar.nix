{
  pkgs,
  config,
  ...
}: {
  services.sketchybar = {
    enable = true;
    extraPackages = [pkgs.aerospace];
    config = ''source "/Users/${config.user.name}/.config/sketchybar/sketchybarrc"'';
  };
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
}
