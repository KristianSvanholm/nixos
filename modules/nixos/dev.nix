{inputs, ...}: {
  imports = [
    inputs.nix-index-database.nixosModules.nix-index
  ];

  programs.nix-index-database.comma.enable = true;
  programs.nix-ld.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    direnvrcExtra = ''
      echo "loaded direnv!"
    '';
    settings.log_format = "-";
    settings.log_filter = "^$";
  };
}
