{...}: {
  services.displayManager.ly = {
    enable = true;
    settings.save = true; # Save current desktop & user
    settings.load = true; # Load saved desktop & user
  };

  # Turn on gnome keyring to store 2fac auth.
  # If encounter "login password no longer match keyring password" error:
  # rm ~/.local/share/keyrings/login.keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.ly.enableGnomeKeyring = true;
}
