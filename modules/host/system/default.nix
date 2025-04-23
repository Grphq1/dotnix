{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages.nix
    ./services.nix
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["ntfs"];
  boot.cleanTmpDir = true;

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tehran";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.alirezam = {
    isNormalUser = true;
    description = "Alireza Momeni";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.variables.EDITOR = "nvim";

  # Firewall
  networking.firewall.allowedTCPPorts = [3000];
  networking.firewall.allowedUDPPorts = [3000];
  networking.firewall.enable = false;
}
