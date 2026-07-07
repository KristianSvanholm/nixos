{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.mangowm.hmModules.mango
    ./swaylock.nix
  ];
  wayland.windowManager.mango = {
    enable = true;
    autostart_sh = ''
      waybar &
      ${pkgs._1password-gui}/bin/1password --silent &

    '';
    extraConfig = '''';
    settings = {
      tagrule = "id:1,layout_name:scroller";

      monitorrule = "name:DP-2,width:2560,height:1440,refresh:165,scale:1";
      xkb_rules_layout = "no";

      scroller_proportion_preset = "0.5,0.8,1.0";
      no_border_when_single = 1;
      borderpx = 2;
      border_radius = 2;
      bordercolor = "0x${config.lib.stylix.colors.base00}ff";
      focuscolor = "0x${config.tint}ff";

      cursor_size = 16;
      syncobj_enable = 1;
      allow_lock_transparent = 1;
      blur = 0;
      animations = 1;
      animation = {
        type_open = "zoom";
        type_close = "zoom";
        duration_close = 200;
        duration_open = 200;
        duration_move = 200;
        duration_tag = 200;
        curve_open = "0,0,0.58,1";
        curve_close = "0,0,0.58,1";
      };
      mousebind = [
        "SUPER,btn_right,moveresize,curresize"
      ];
      bind = [
        "SUPER,r,reload_config"

        # spawn
        "SUPER,Return,spawn,alacritty"
        "SUPER,d,spawn_shell,rofi -show drun"
        "SUPER,e,spawn,nautilus"
        "SUPER,x,spawn,swaylock"
        "SUPER,tab,spawn_shell,grim -g \"$(slurp)\" - | wl-copy"

        # manipulate
        "SUPER,f,togglefullscreen"
        "SUPER,v,togglefloating"
        "SUPER,q,killclient"
        "SUPER,c,centerwin"
        "SUPER,t,switch_proportion_preset"

        # focus
        "SUPER,h,focusdir,left"
        "SUPER,j,focusdir,down"
        "SUPER,k,focusdir,up"
        "SUPER,l,focusdir,right"

        # move
        "SUPER+SHIFT,h,exchange_client,left"
        "SUPER+SHIFT,j,exchange_client,down"
        "SUPER+SHIFT,k,exchange_client,up"
        "SUPER+SHIFT,l,exchange_client,right"

        # tags
        "SUPER,1,view,1"
        "SUPER,2,view,2"
        "SUPER,3,view,3"
        "SUPER,4,view,4"
        "SUPER,5,view,5"

        "SUPER+SHIFT,1,tagsilent,1"
        "SUPER+SHIFT,2,tagsilent,2"
        "SUPER+SHIFT,3,tagsilent,3"
        "SUPER+SHIFT,4,tagsilent,4"
        "SUPER+SHIFT,5,tagsilent,5"
      ];
    };
  };
}
