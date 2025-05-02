{ pkgs, ... }:
with pkgs;
let
    R-with-pkgs = rWrapper.override { packages = with rPackages; [ggplot2 dplyr svglite forcats]; };
    #Rstudio-with-pkgs = rstudioWrapper.override { packages = with rPackages; [ggplot2 dplyr svglite]; };
in
{
    environment.systemPackages = [
        #Rstudio-with-pkgs
        R-with-pkgs
    ]; 

}
