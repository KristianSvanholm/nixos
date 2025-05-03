{...}: {
  services.flameshot.enable = true;
  services.flameshot.settings.General = {
    disabledTrayIcon = true;
    showStartupLaunchMessage = false;
    startupLaunch = false;
    showHelp = false;
    uiColor = "#C0A36E";
  };
}
