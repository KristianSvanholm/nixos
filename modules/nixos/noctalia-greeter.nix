{inputs, ...}: {
  imports = [inputs.noctalia-greeter.nixosModules.default];

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  programs.noctalia-greeter = {
    enable = true;

    settings = {
      session.default = "Umbriel";

      appearance = {
        scheme = "Gruvbox";
        theme_mode = "dark";
        corner_radius_scale = 0.0;
      };

      keyboard.layout = "no";
    };
  };
}
