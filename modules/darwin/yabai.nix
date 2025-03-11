{...}:
{
    services.yabai = {
        enable = true;
        enableScriptingAddition = true;
        config = {
            # Layout
            layout = "bsp";
            window_placement = "second_child";

            # Padding
            top_padding = 0;
            bottom_padding = 0;
            left_padding = 0;
            right_padding = 0;
            window_gap = 5;
            
            # Mouse
            mouse_follows_focus = "on";
            focus_follows_mouse = "autofocus";

            # Clickdrag
            mouse_modifier = "alt";
            mouse_action1 = "move";
            mouse_action2 = "resize";

            # Window swap
            mouse_drop_action = "swap";

            # etc
            auto_balance = "on";
            window_topmost = "on";
        };
        extraConfig = ''
            yabai -m rule --add app="^System Settings$" manage=off
        '';
    };
}
