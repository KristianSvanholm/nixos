{...}: {
  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure console keymap
  console.keyMap = "no";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };
}
