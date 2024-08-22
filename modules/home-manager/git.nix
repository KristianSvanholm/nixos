{ config, pkgs, ... }:

{
    # git
    home.packages = [pkgs.git];
    programs.git.enable = true;
    programs.git.userName = "KristianSvanholm";
    programs.git.userEmail = "KristianRorenSvanholm@gmail.com";
    programs.git.extraConfig = {
        init.defaultBranch = "main";
    };
}
