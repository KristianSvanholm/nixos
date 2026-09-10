{pkgs, ...}: {
  # Audio w/ pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # Disable the Bluetooth handsfree/headset (HFP/HSP) roles so headsets
    # (e.g. Sony XM3) only expose high-quality A2DP output and never a
    # low-quality mic, leaving the standalone microphone as the default input.
    wireplumber.extraConfig."51-disable-bluetooth-hfp" = {
      "monitor.bluez.properties" = {
        "bluez5.roles" = ["a2dp_sink" "a2dp_source"];
        "bluez5.autoswitch-profile" = false;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

}
