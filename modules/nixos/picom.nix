{...}: {
  services.picom = {
    enable = true;
    opacityRules = [
      "90:class_g = 'Alacritty' && focused"
      "50:class_g = 'Alacritty' && !focused"
    ];
    settings = {
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };
    vSync = true;
  };
}
