{ ... }:
{
    programs.eza = {
	enable = true;
	enableZshIntegration = true;
	extraOptions = ["--icons" "--git"];
	git = true;
	icons = true;
    };
}
