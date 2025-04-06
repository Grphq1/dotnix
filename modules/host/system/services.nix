{
  config,
  pkgs,
  ...
}: {
  services.wordpress.sites."localhost" = {};
  services.blueman.enable = true;

  # Display manager
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
  };

  services.upower.enable = true;
  powerManagement.enable = true;

  services.devmon.enable = true;
}
