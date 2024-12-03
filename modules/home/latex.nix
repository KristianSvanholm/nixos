{ pkgs, ... }: 
{
    home.packages = with pkgs; [ 
	zathura
	texliveFull
	#python312Packages.pygments
    ];
}
