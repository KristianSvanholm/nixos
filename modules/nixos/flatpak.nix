{...}: {
  nixpkgs.overlays = [
    (_final: prev: {
      flatpak = prev.flatpak.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [ ./patches/flatpak-fix-portal-env.patch ];
      });
    })
  ];

  services.flatpak.enable = true;
}
