{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../modules/host
  ];

  system.stateVersion = "24.11";
}
