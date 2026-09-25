#!/usr/bin/env bash
# Destructive: wipes the disk in hosts/<host>/disko.nix. Run from the repo root.
set -euo pipefail

HOST="${1:-mini}"

[[ $EUID -eq 0 ]] || { echo "run as root" >&2; exit 1; }
[[ -f flake.nix ]] || { echo "run from the repo root" >&2; exit 1; }

read -rp "destroy and reinstall '$HOST'? [y/N] " a
[[ ${a,,} == y ]] || exit 1

nix --extra-experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode destroy,format,mount --flake ".#$HOST"

nixos-install --flake ".#$HOST" --max-jobs 2 \
  --option extra-substituters "http://192.168.3.112:30800/homelab" \
  --option extra-trusted-public-keys "homelab:SOrR7Lbq4eAhpglgP6XjGRzS9j5M05KT+ewCH16rwyo="
