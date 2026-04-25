{...}: {
  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
    extraConfig = "Defaults pwfeedback";
  };
}
