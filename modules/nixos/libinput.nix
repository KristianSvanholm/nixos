{...}: {
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Logitech G Pro Superlight via Unifying Receiver]
    MatchVendor=0x046D
    MatchProduct=0xC547
    AttrEventCode=-REL_WHEEL_HI_RES;-REL_HWHEEL_HI_RES
  '';
}
