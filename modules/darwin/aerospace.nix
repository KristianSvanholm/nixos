{...}: {
  services.aerospace = {
    enable = true;
    settings = {
      config-version = 2;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      on-focus-changed = ["move-mouse window-lazy-center"];
      exec.env-vars.PATH = "\${HOME}/.nix-profile/bin:/run/current-system/sw/bin:/opt/homebrew/bin:/opt/homebrew/sbin:\${PATH}";
      persistent-workspaces = [
        "1"
        "2"
        "3"
        "4"
        "5"
      ];
      workspace-to-monitor-force-assignment = {
        "1" = ["main" "secondary"];
        "2" = ["secondary" "main"];
        "3" = ["secondary" "main"];
        "4" = ["secondary" "main"];
        "5" = ["secondary" "main"];
      };
      gaps = {
        outer.left = 8;
        outer.bottom = 8;
        outer.top = 8;
        outer.right = 8;
        inner.horizontal = 8;
        inner.vertical = 8;
      };
      mode.main.binding = {
        cmd-enter = "exec-and-forget alacritty";
        cmd-q = "close --quit-if-last-window";

        cmd-h = "focus --boundaries all-monitors-outer-frame left";
        cmd-j = "focus --boundaries all-monitors-outer-frame down";
        cmd-k = "focus --boundaries all-monitors-outer-frame up";
        cmd-l = "focus --boundaries all-monitors-outer-frame right";
        cmd-shift-h = ["move --boundaries all-monitors-outer-frame left"];
        cmd-shift-j = ["move --boundaries all-monitors-outer-frame down"];
        cmd-shift-k = ["move --boundaries all-monitors-outer-frame up"];
        cmd-shift-l = ["move --boundaries all-monitors-outer-frame right"];

        cmd-shift-up = "move-node-to-monitor --focus-follows-window up";
        cmd-shift-down = "move-node-to-monitor --focus-follows-window down";
        cmd-shift-left = "move-node-to-monitor --focus-follows-window left";
        cmd-shift-right = "move-node-to-monitor --focus-follows-window right";

        cmd-up = "focus-monitor up";
        cmd-down = "focus-monitor down";
        cmd-left = "focus-monitor left";
        cmd-right = "focus-monitor right";

        cmd-f = "fullscreen";

        cmd-1 = "workspace 1";
        cmd-2 = "workspace 2";
        cmd-3 = "workspace 3";
        cmd-4 = "workspace 4";
        cmd-5 = "workspace 5";

        cmd-shift-1 = ["move-node-to-workspace --focus-follows-window 1"];
        cmd-shift-2 = ["move-node-to-workspace --focus-follows-window 2"];
        cmd-shift-3 = ["move-node-to-workspace --focus-follows-window 3"];
        cmd-shift-4 = ["move-node-to-workspace --focus-follows-window 4"];
        cmd-shift-5 = ["move-node-to-workspace --focus-follows-window 5"];

        alt-shift-c = "reload-config";
        cmd-alt-h = [];
      };
    };
  };
}
