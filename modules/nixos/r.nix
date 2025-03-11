{ pkgs, ... }:
with pkgs;
let
    R-with-pkgs = rWrapper.override { packages = with rPackages; [ggplot2 dplyr]; };
    Rstudio-with-pkgs = rstudioWrapper.override { packages = with rPackages; [ggplot2 dplyr]; };
in
{
    environment.systemPackages = [
        Rstudio-with-pkgs
        R-with-pkgs
    ]; 

}
