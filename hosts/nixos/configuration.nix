# Host-specific configuration for nixos
{
  config,
  pkgs,
  hostname,
  username,
  myLib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  # System configuration
  networking.hostName = hostname;
  
  # Host-specific configuration overrides
  # These settings will override anything defined in the modules

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. Do not change unless you know what you
  # are doing.
  system.stateVersion = "25.05";
}
