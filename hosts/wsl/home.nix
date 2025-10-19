{...}: {
  imports = [
    ../home.nix
  ];

  git.email = "kristian-roren.svanholm@gjensidige.no";
  git.localSSHKey = true;
}
