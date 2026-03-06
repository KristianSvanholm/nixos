{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.darwinModules.stylix];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    image = ../../wallpapers/fishing.png;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 8;
        terminal = 10;
        desktop = 8;
        popups = 8;
      };
    };
    autoEnable = true;
    homeManagerIntegration.followSystem = true;
  };
}
