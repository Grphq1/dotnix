{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nixpkgs-unstable,
  ...
}: {
  imports = [
    ../modules/home-manager
  ];

  _module.args.unstable-pkgs = import <nixos-unstable> {};
  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
