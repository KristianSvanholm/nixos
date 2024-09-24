{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
	nmap
	python312Packages.censys
    ];
}

