{
  lib,
  config,
  username,
  ...
}:
with lib; {
  options.git = {
    email = mkOption {
      type = types.str;
      description = "github user email";
      default = "kristianrorensvanholm@gmail.com";
    };

    username = mkOption {
      type = types.str;
      description = "github username";
      default = "KristianSvanholm";
    };

    signing = mkOption {
      type = types.bool;
      description = "enable git commit signing";
      default = false;
    };
  };

  config = {
    # git
    programs.git = {
      enable = true;
      userName = config.git.username;
      userEmail = config.git.email;
      signing = {
        format = "ssh";
        key = "/home/${username}/.ssh/id_ed25519";
        signByDefault = config.git.signing;
      };
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
        rebase.autoStash = true;
        log.abbrevCommit = true;
        url = {
          "git@github.com:".insteadOf = ["gh:"];
          "git@github.com:${config.git.username}/".insteadOf = ["me:"];
        };
        status = {
          branch = true;
          showStash = true;
          showUntrackedFiles = "all";
        };
      };
    };
  };
}
