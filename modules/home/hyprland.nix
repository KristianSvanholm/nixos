{pkgs, config, ... }: 
{

    imports = [
	./hyprlock.nix
	./hyprpaper.nix
	./waybar.nix
	./rofi.nix
    ];

    stylix.targets.hyprland.enable = false;

    wayland.windowManager.hyprland = {
	enable = true;
	xwayland.enable = true;

	systemd = {
	    enable = true;
	    variables = [ "-all" ];
	};

	settings = {
	    
	    env = [ "WEBKIT_DISABLE_DMABUF_RENDERER,1" ];

	    input = {
		kb_layout = "no";
		follow_mouse = 1;
	    };

	    general = {
		gaps_in = 0;
		gaps_out = 0;
		"col.active_border" = "rgb(${config.lib.stylix.colors.base0E})";
	    };

	    misc = {
		disable_hyprland_logo = true;
		disable_splash_rendering = true;

		enable_swallow = true;
		swallow_regex = "^(Alacritty)$";
	    };

	    decoration = {
		rounding = 0;
		blur.enabled = false;
		shadow.enabled = false;

		active_opacity = 1;
		inactive_opacity = 1;
	    };

	    cursor = {
		no_hardware_cursors = true;
	    };

	    animations = {
		enabled = false;
	    };
    
	    exec-once = [ "waybar" "hyprpaper" "${pkgs._1password-gui}/bin/1password --silent"];

            windowrulev2 = [
                "float, class:1Password"
                "size 70% 70%, class:1Password"
                "center, class:1Password"
            ];

	    monitor = [
                "HDMI-A-1, 2560x1440, 0x0, 1"
                "HDMI-A-2, 1920x1080, 2560x0, 1, transform, 3"
                "DP-1, 2560x1440@144, 0x0, 1"
                "DP-2, 1920x1080@144, 2560x0, 1"
	    ];

	    workspace = [
		"1,monitor:HDMI-A-1"
		"2,monitor:HDMI-A-2"
		"3,monitor:HDMI-A-1"
		"4,monitor:HDMI-A-2"
		"5,monitor:HDMI-A-1"
		"6,monitor:HDMI-A-2"
		"7,monitor:HDMI-A-1"
		"8,monitor:HDMI-A-2"
		"9,monitor:HDMI-A-1"
		"0,monitor:HDMI-A-2"

		"1,monitor:DP-1"
		"2,monitor:DP-2"
		"3,monitor:DP-1"
		"4,monitor:DP-2"
		"5,monitor:DP-1"
		"6,monitor:DP-2"
		"7,monitor:DP-1"
		"8,monitor:DP-2"
		"9,monitor:DP-1"
		"0,monitor:DP-2"
	    ];

	    bind = [
		# See https://wiki.hyprland.org/Configuring/Keywords/
		# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
		"SUPER, RETURN, exec, alacritty"
		"SUPER, Q, killactive,"
		"SUPER, M, exit,"
		"SUPER,F,fullscreen"
		"ALT, TAB, exec, wayshot -s \"$(slurp)\" --stdout | wl-copy"
		"SUPER, TAB, exec, wayshot -s \"$(slurp)\""
		"SUPER, E, exec, dolphin"
                "SUPER, Z, exec, zen"
		"SUPER, X, exec, hyprlock"
		"SUPER, V, togglefloating,"
		"SUPER, D, exec, rofi -show drun"
		"SUPER, W, exec, rofi -show window"
                "SUPER, C, exec, rofi -show calc -modi calc -no-show-match -no-persist-history -no-sort"

		"SUPER, B, exec, pkill waybar || waybar"
		    
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
                "SUPER, H, movefocus, l"
		"SUPER, L, movefocus, r"
		"SUPER, K, movefocus, u"
		"SUPER, J, movefocus, d"
		
		# Move window
    		"SUPER SHIFT, H, movewindow, l"
		"SUPER SHIFT, L, movewindow, r"
		"SUPER SHIFT, K, movewindow, u"
		"SUPER SHIFT, J, movewindow, d"

		# Resize window
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
