# OS Config

## Deploy OS

In whatever directory you have cloned this config into:

```
$ sudo nixos-rebuild switch --flake .#system
```

## Deploy home-manager

```
$ home-manager switch --flake .#user
```
