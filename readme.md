# OS Config

## Generate themes folders
```
$ nix build nixpkgs#base16-schemes
```

## Deploy OS

In whatever directory you have cloned this config into:

```
$ sudo nixos-rebuild switch --flake .#default
```
