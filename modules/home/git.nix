{ config, pkgs, ... }:

{
    # git
    programs.git = {
	enable = true;
	userName = "KristianSvanholm";
	userEmail = "KristianRorenSvanholm@gmail.com";
	extraConfig = {
	    init.defaultBranch = "main";
	    push.autoSetupRemote = true;
	    pull.rebase = false;
	};
    };
}
