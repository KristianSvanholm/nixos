# NixOS Config

![Rice](./rice.png)

## Hosts

_Mini_ -- Daily driver\
_Homelab_ -- My k3s box\
_Darwin_ -- Work laptop\
_wsl_ -- Old work config

## Deploy OS

```
$ sudo nixos-rebuild switch --flake .#mini
```

## Generate themes folders

```
$ nix build nixpkgs#base16-schemes
```
