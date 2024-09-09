# OS Config

## Generate themes folders
```
$ nix build nixpkgs#base16-schemes
```

## Install BetterDiscord
```
$ nix run nixpkgs#betterdiscordctl install
```

## Deploy OS

In whatever directory you have cloned this config into:

```
$ sudo nixos-rebuild switch --flake .#default
```

Then, the alias 'switch' will be available for future use:
```
$ switch --flake .#default
```
