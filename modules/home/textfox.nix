{
  inputs,
  config,
  ...
}: {
  imports = [inputs.textfox.homeManagerModules.default];
  programs.firefox.enable = true;

  stylix.targets.firefox.enable = false;
  textfox = {
    profiles = ["textfox"];
    enable = true;
    config = {
      background = {
        color = "#${config.lib.stylix.colors.base01}";
      };
      border = {
        #color = "#${config.lib.stylix.colors.base09}";
      };
      displaySidebarTools = false;
      tabs = {
        horizontal.enable = true;
      };
    };
  };
}
