{...}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "none";
    };

    taps = ["jurplel/tap"];
    casks = ["instant-space-switcher"];
  };
}
