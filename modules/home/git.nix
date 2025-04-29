{ ... }:

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
            url = {
                "https://github.com/".insteadOf = ["gh:"];
                "git@github.com:kristiansvanholm/".insteadOf = ["me:"];
            };
	};
    };
}
