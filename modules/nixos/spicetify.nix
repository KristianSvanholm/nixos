{
  inputs,
  pkgs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [
    inputs.spicetify-nix.nixosModules.spicetify
  ];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle
    ];
    theme = lib.mkForce spicePkgs.themes.text;
    colorScheme = lib.mkForce "Spotify";
  };
}
