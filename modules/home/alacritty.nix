{ ... }:
{
    programs.alacritty = {
        enable = true;
        settings = {
            window.decorations = "None";
            scrolling = {
                history = 10000;
                multiplier = 3;
            };
            font = {
                normal.family = "JetBrainsMono Nerd Font";
                size = 10;
            };
        };
    };
}
