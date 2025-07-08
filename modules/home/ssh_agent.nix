{...}: let
  onePassPath = "~/.1password/agent.sock";
in {
  # 1password SSH agent config
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ${onePassPath}
    '';
  };
}
