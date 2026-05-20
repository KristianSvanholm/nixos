{inputs, ...}: {
  imports = [inputs.mangowm.nixosModules.mango];
  programs.mango = {
    enable = true;
    addLoginEntry = true;
  };
}
