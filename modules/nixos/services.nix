# System services configuration
{ config, pkgs, username, ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  services = {
    blueman.enable = true;
    
    upower.enable = true;
    
    getty.autologinUser = "${username}";
    
    # Device mounting
    devmon.enable = true;
    
    tlp = {
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
        
        START_CHARGE_THRESH_BAT0 = 30;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };
    
    # tor = {
    #   enable = true;
    #   settings = {
    #     UseBridges = true;
    #     ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/obfs4proxy";
    #   };
    # };
    
    # X server with i3 (backup WM)
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status  
          i3lock
          i3blocks
        ];
      };
    };
  };
}
