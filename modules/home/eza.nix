{ ... }:
{
    programs.eza = {
	enable = true;
	enableBashIntegration = true;
	extraOptions = ["--icons" "--git"];
	git = true;
	icons = true;
    };
}
