{pkgs, ...}: {
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = false;
    config = {
      layout = "bsp";
      mouse_follows_focus = "on";
      focus_follows_mouse = "autofocus";
    };
  };
}
