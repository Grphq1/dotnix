# Boot configuration
{
  config,
  pkgs,
  ...
}: {
  # Bootloader configuration
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # File system support
    supportedFilesystems = ["ntfs"];

    # Clean /tmp on boot
    tmp.cleanOnBoot = true;
  };
}
