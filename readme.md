# OS Config

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
