{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default
    ../home.nix
  ];

  git.email = "kristian-roren.svanholm@gjensidige.no";
  git.signing = true;
}
