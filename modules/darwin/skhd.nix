{...}:
{
    services.skhd = {
        enable = true;
        skhdConfig = ''

            alt - return : alacritty

            # [Yabai]
            # change window focus within space
            alt - j : yabai -m window --focus south
            alt - k : yabai -m window --focus north
            alt - h : yabai -m window --focus west
            alt - l : yabai -m window --focus east

            # swap windows
            shift + alt - j : yabai -m window --swap south
            shift + alt - k : yabai -m window --swap north
            shift + alt - h : yabai -m window --swap west
            shift + alt - l : yabai -m window --swap east

            # move window to space #
            shift + alt - 1 : yabai -m window --space 1 && switchspace 1
            shift + alt - 2 : yabai -m window --space 2 && switchspace 2
            shift + alt - 3 : yabai -m window --space 3 && switchspace 3
            shift + alt - 4 : yabai -m window --space 4 && switchspace 4
            shift + alt - 5 : yabai -m window --space 5 && switchspace 5
            shift + alt - 6 : yabai -m window --space 6 && switchspace 6
            shift + alt - 7 : yabai -m window --space 7 && switchspace 7

            # resize window
            ctrl + alt - h : yabai -m window --resize right:-20:0 2> /dev/null || yabai -m window --resize left:-20:0 2> /dev/null
            ctrl + alt - j : yabai -m window --resize bottom:0:20 2> /dev/null || yabai -m window --resize top:0:20 2> /dev/null
            ctrl + alt - k : yabai -m window --resize bottom:0:-20 2> /dev/null || yabai -m window --resize top:0:-20 2> /dev/n.ll
            ctrl + alt - l : yabai -m window --resize right:20:0 2> /dev/null || yabai -m window --resize left:20:0 2> /dev/null

            # change move window between displays
            shift + alt - e : yabai -m window --display next; yabai -m display --focus next
            shift + alt - w : yabai -m window --display prev; yabai -m display --focus prev

            #change focus between external displays (left and right)
            alt - e: yabai -m display --focus prev
            alt - w: yabai -m display --focus next

            # maximize a window
            shift + alt - f : yabai -m window --toggle zoom-fullscreen

            # balance out tree of windows (resize to occupy same area)
            shift + alt - e : yabai -m space --balance
        '';
    };
}
