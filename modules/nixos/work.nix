{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    slack
    teams-for-linux
  ];
}
