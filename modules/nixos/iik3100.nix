{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
	nmap
	dirb
	netcat
	thc-hydra
	python312Packages.censys
	gdb
	ghidra
    ];
}

