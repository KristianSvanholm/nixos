{...}: {
  # git
  programs.git = {
    enable = true;
    userName = "KristianSvanholm";
    userEmail = "KristianRorenSvanholm@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      rebase.autoStash = true;
      log.abbrevCommit = true;
      url = {
        "git@github.com:".insteadOf = ["gh:"];
        "git@github.com:kristiansvanholm/".insteadOf = ["me:"];
      };
      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };
    };
  };
}
