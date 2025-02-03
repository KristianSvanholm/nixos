{ pkgs, ... }:
{
    home.packages = with pkgs; [modrinth-app];

    # Files located in ~/.nix-profile/share/applications/
    xdg.desktopEntries."Modrinth App" = {
        name = "Modrinth App";
        exec = "env WEBKIT_DISABLE_DMABUF_RENDERER=1 GDK_BACKEND=x11 ModrinthApp";
        icon = "ModrinthApp";
        terminal = false;
        type = "Application";
        comment = "Modrinth's game launcher";
        startupNotify = true;
        categories = [ "Game" "ActionGame" "AdventureGame" "Simulation" ];
    };

}
