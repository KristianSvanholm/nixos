{inputs, ...}: {
  imports = [inputs.luciole.nixosModules.default];
  programs.luciole.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
