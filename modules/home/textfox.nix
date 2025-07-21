{inputs, ...}: {
  imports = [inputs.textfox.homeManagerModules.default];
  #programs.firefox.enable = true;

  stylix.targets.firefox.enable = false;
  textfox = {
    enable = true;
    profile = "textfox";
  };
}
