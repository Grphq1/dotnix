# Virtualization configuration
{
  config,
  pkgs,
  ...
}: {
  virtualisation = {
    waydroid.enable = false;

    docker = {
      enable = false;
      # Run rootless docker
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      # Use overlay2 storage driver for better performance
      storageDriver = "overlay2";
      # Auto-prune docker images and containers
      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = ["--all"];
      };
    };

    podman = {
      enable = false;
      # Don't make podman create a user socket (conflicts with docker)
      dockerSocket.enable = false;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    distrobox
    virt-manager
  ];
}
