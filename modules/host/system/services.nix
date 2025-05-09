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

  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       START_CHARGE_THRESH_BAT0 = 40;
       STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
}
