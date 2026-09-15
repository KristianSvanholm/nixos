{inputs, ...}: {
  imports = [inputs.noctalia-greeter.nixosModules.default];

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
