{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
	nmap
	netcat
	thc-hydra
	python312Packages.censys
    ];
}

