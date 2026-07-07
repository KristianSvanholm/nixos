{inputs, ...}: {
  imports = [inputs.sysc-greet.nixosModules.default];
  services.sysc-greet = {
    enable = true;
    compositor = "niri";
  };

  # Turn on gnome keyring to store 2fac auth.
  # If encounter "login password no longer match keyring password" error:
  # rm ~/.local/share/keyrings/login.keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sysc-greet.enableGnomeKeyring = true;
}
