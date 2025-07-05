# User-specific home-manager configuration for alirezam
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home-manager/default.nix
  ];

  # Home Manager configuration
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  
  # Disable all dconf functionality
  dconf.enable = false;

  # User information
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "lorem10";
    userEmail = "momenei.alireza1382.15@gmail.com";
  };
}
