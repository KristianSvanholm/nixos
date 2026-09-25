{inputs, ...}: {
  imports = [inputs.noctalia-greeter.nixosModules.default];

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  services.displayManager.noctalia-greeter = {
    enable = true;

    settings = {
      session.default = "Umbriel";

      appearance = {
        scheme = "Synced";
        theme_mode = "dark";
        corner_radius_scale = 0.0;
      };

      keyboard.layout = "no";
    };
  };
}
