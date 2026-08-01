{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
  ];
}
