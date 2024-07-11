{ pkgs, ... }:

{
    # I3
    services.xserver = {
        enable = true;

        desktopManager = {
            xterm.enable = false;
        };
        
        windowManager.i3 = {
            enable = true;
            extraPackages = with pkgs; [
                rofi
                i3status
                i3lock
            ];
        };
    };

    services.displayManager.defaultSession = "none+i3";
}
