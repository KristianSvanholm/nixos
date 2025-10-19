{
  pkgs,
  lib,
  config,
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

    localSSHKey = mkOption {
      type = types.bool;
      description = "use local ssh key";
      default = false;
    };

    opSSHKey = mkOption {
      type = types.bool;
      description = "use 1password ssh key through ssh agent";
      default = false;
    };
  };

  config = {
    # git
    programs.git = {
      enable = true;
      userName = config.git.username;
      userEmail = config.git.email;
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

      # local ssh key
      signing =
        if config.git.localSSHKey
        then {
          format = "ssh";
          key = "${config.user.home}/.ssh/id_ed25519";
          signByDefault = true;
        }
        else if config.git.opSSHKey
        then {
          format = "ssh";
          key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOK8RufgRPvoPDRovOxteHN5ZEAXiJpXwJfVQuZsVtmj";
          signByDefault = true;
          signer = "${pkgs._1password-gui}/bin/op-ssh-sign";
        }
        else {};
    };
  };
}
