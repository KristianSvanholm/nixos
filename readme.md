# NixOS Config

![Rice](./rice.png)

## Hosts

_Mini_ -- Daily driver\
_Homelab_ -- My k3s box\
_Darwin_ -- Work laptop\
_wsl_ -- Old work config

## Structure

hosts/ -- Jost configurations and shared modules.\
modules/nixos -- NixOS native modules\
modules/home -- Home-manager modules\
modules/darwin -- Darwin modules

## Deploy OS

```
$ sudo nixos-rebuild switch --flake .#mini
```

Then, the alias 'switch' will be available for future use:

```
$ switch --flake .#default
```

## Generate themes folders

```
$ nix build nixpkgs#base16-schemes
```

## Install BetterDiscord

```
$ nix run nixpkgs#betterdiscordctl install
```
