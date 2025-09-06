{
  pkgs,
  config,
  ...
}: {
  # Enable CLI
  programs._1password = {
    enable = true;
  };

  # Enable GUI with authorized user
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [config.user.name];
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

  # Turn on gnome keyring to store 2fac auth.
  # If encounter "login password no longer match keyring password" error:
  # rm ~/.local/share/keyrings/login.keyring
  services.gnome.gnome-keyring.enable = true;
}
