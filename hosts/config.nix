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
}
