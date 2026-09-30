{pkgs, ...}: {
  programs.lutris = {
    enable = true;
    #defaultWinePackage = pkgs.proton-ge-bin;
  };
}
