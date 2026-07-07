{lib, ...}:
with lib; {
  options.user = {
    home = mkOption {
      type = types.str;
      description = "home path";
      default = "/home/krs";
    };
    name = mkOption {
      type = types.str;
      description = "username";
      default = "krs";
    };
  };

  # UI tint
  options.tint = mkOption {
    type = types.str;
    description = "Accent/tint color (hex without #)";
    default = "fe8019";
  };
}
