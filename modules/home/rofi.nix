{ ... }:
{
    programs.rofi.enable = true;
    programs.rofi.extraConfig = {
	modi = "drun";
	show-icons = true;
	display-drun = "λ";
	drun-display-format = "{icon} {name}";
    };
}
