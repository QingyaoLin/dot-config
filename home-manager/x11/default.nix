{ config, pkgs, lib, ... }:

{
  imports = [
    ./picom.nix
    ./bspwm.nix
    ./sxhkd
    ./polybar.nix
    ./rofi.nix
    ./dunst.nix
  ];

  xsession.enable = true;
  xsession.numlock.enable = true;
}