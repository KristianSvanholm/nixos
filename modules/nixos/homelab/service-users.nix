# One group per k3s namespace, one user per deployment.
{lib, ...}:
with lib; let
  namespaces = {
    media = {
      gid = 1500;
      users = {
        jellyfin = 1600;
        sonarr = 1601;
        anime-sonarr = 1602;
        radarr = 1603;
        lidarr = 1604;
        bazarr = 1605;
        prowlarr = 1606;
        qbit = 1607;
        sabnzbd = 1608;
        seerr = 1609;
        jfa-go = 1610;
        slskd = 1611;
        flaresolverr = 1612;
        configarr = 1613;
      };
    };
    test-media = {
      gid = 1501;
      users.jellyfin-test = 1620;
    };
    immich = {
      gid = 1502;
      users.immich = 1630;
    };
    attic = {
      gid = 1503;
      users.attic = 1640;
    };
    files = {
      gid = 1504;
      users.filesrv = 1650;
    };
    minecraft = {
      gid = 1505;
      users.minecraft = 1660;
    };
    search = {
      gid = 1506;
      users = {
        hister = 1670;
        searxng = 1671;
      };
    };
    auth = {
      gid = 1507;
      users.lldap = 1680;
    };
    adguard = {
      gid = 1508;
      users.adguard = 1690;
    };
    wg-easy = {
      gid = 1509;
      users.wg-easy = 1700;
    };
  };

  extraGroups.filesrv = ["media"]; # reads the library
in {
  users.groups = mapAttrs (_: ns: {inherit (ns) gid;}) namespaces;

  users.users =
    concatMapAttrs (
      nsName: ns:
        mapAttrs (user: uid: {
          isSystemUser = true;
          inherit uid;
          group = nsName;
          extraGroups = extraGroups.${user} or [];
          description = "k3s ${nsName}/${user}";
        })
        ns.users
    )
    namespaces;
}
