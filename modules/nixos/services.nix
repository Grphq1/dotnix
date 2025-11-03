# System services configuration
{pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
    ];
  };

  services.displayManager = {
    sessionPackages = [pkgs.niri];
    defaultSession = "niri";
    gdm = {
      enable = true;
      wayland = true;
    };
  };

  services = {
    # enable when cosmic comes to stable
    # desktopManager.cosmic.enable = true;

    blueman.enable = true;

    upower.enable = true;

    # Device mounting
    devmon.enable = true;

    tlp = {
      # i disable tlp because conflicts with dank shell battery management
      enable = false;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 80;

        START_CHARGE_THRESH_BAT0 = 30;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };

    # ollama = {
    #   enable = true;
    #   # Optional: preload models, see https://ollama.com/library
    #   loadModels = ["llama3:8b"];
    # };

    # tor = {
    #   enable = true;
    #   settings = {
    #     UseBridges = true;
    #     ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/obfs4proxy";
    #   };
    # };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-wlr];
    config.common.default = "wlr";
  };
}
