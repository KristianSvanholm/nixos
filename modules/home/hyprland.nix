{ ... }: 
{
    wayland.windowManager.hyprland = {
	enable = true;
	xwayland.enable = true;
	
	systemd = {
	    enable = true;
	    variables = [ "-all" ];
	};

	settings = {
	    
	    env = [
		"WEBKIT_DISABLE_DMABUF_RENDERER,1"
	    ];

	    input = {
		kb_layout = "no";
		follow_mouse = 1;
	    };

	    general = {
		gaps_in = 5;
		gaps_out = 15;
	    };

	    misc = {
		disable_hyprland_logo = true;
		disable_splash_rendering = true;

		enable_swallow = true;
		swallow_regex = "^(Alacritty)$";
	    };

	    decoration = {
		rounding = 0;
		blur = { 
		    enabled = true;
		    size = 3;
		    passes = 3;
		    new_optimizations = true;
		};
		
		active_opacity = 1;
		inactive_opacity = 1;
		drop_shadow = false;
	    };

	    animations = {
		enabled = false;
	    };
    
	    exec-once = "waybar";

	    monitor = [
		"DP-2, 2560x1440@144, 0x0, 1"
		"DP-1, 1920x1080@144, 2560x0, 1"
	    ];

	    bind = [
		# See https://wiki.hyprland.org/Configuring/Keywords/
		# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
		"SUPER, RETURN, exec, alacritty"
		"SUPER SHIFT, Q, killactive,"
		"SUPER, M, exit,"
		"SUPER,F,fullscreen"
		"ALT, TAB, exec, flameshot gui"
		"SUPER, E, exec, thunar"
		"SUPER, V, togglefloating,"
		"SUPER, Space, exec, rofi -modi drun,run -show drun"
		"SUPER, P, pseudo," # dwindle
		"SUPER, J, togglesplit," # dwindle

		# Switch workspaces with mod + [0-9]
		"SUPER, 1, workspace, 1"
		"SUPER, 2, workspace, 2"
		"SUPER, 3, workspace, 3"
		"SUPER, 4, workspace, 4"
		"SUPER, 5, workspace, 5"
		"SUPER, 6, workspace, 6"
		"SUPER, 7, workspace, 7"
		"SUPER, 8, workspace, 8"
		"SUPER, 9, workspace, 9"
		"SUPER, 0, workspace, 10"

		# Move active window to a workspace with mod + SHIFT + [0-9]
		"SUPER SHIFT, 1, movetoworkspace, 1"
		"SUPER SHIFT, 2, movetoworkspace, 2"
		"SUPER SHIFT, 3, movetoworkspace, 3"
		"SUPER SHIFT, 4, movetoworkspace, 4"
		"SUPER SHIFT, 5, movetoworkspace, 5"
		"SUPER SHIFT, 6, movetoworkspace, 6"
		"SUPER SHIFT, 7, movetoworkspace, 7"
		"SUPER SHIFT, 8, movetoworkspace, 8"
		"SUPER SHIFT, 9, movetoworkspace, 9"
		"SUPER SHIFT, 0, movetoworkspace, 10"

		# Example special workspace (scratchpad)
		"SUPER, S, togglespecialworkspace, magic"
		"SUPER SHIFT, S, movetoworkspace, special:magic"

		# Move focus
		"SUPER, left, movefocus, l"
		"SUPER, right, movefocus, r"
		"SUPER, up, movefocus, u"
		"SUPER, down, movefocus, d"

		# Move window
		"SUPER SHIFT, left, movewindow, l"
		"SUPER SHIFT, right, movewindow, r"
		"SUPER SHIFT, up, movewindow, u"
		"SUPER SHIFT, down, movewindow, d"

		# Resize window
		"SUPER CTRL, left, resizeactive, -50 0"
		"SUPER CTRL, right, resizeactive, 50 0"
		"SUPER CTRL, up, resizeactive, 0 -50"
		"SUPER CTRL, down, resizeactive, 0 50"
		"SUPER CTRL, L, resizeactive, 50 0"
		"SUPER CTRL, H, resizeactive, -50 0"
		"SUPER CTRL, K, resizeactive, 0 -50"
		"SUPER CTRL, J, resizeactive, 0 50"
	    ];

	    bindm = [
		# Move/resize windows with mod + LMB/RMB and dragging
		"SUPER, mouse:272, movewindow"
		"SUPER, mouse:273, resizewindow"
	    ];
	};
    };    
}
