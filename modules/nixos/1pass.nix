{username, ...}: {
  # Enable CLI
  programs._1password = {
    enable = true;
  };

  # Enable GUI with authorized user
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [username];
  };

  # Add Zen to trusted browsers
  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        zen
      '';
      mode = "0755";
    };
  };
}
