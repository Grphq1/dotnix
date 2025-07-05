# Security configuration
{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  
  programs.nix-ld.enable = true;
  
  security = {
    apparmor = {
      enable = true;
      packages = [ pkgs.apparmor-profiles ];
    };
    
    auditd.enable = true;
    
    # Protect against Spectre and Meltdown vulnerabilities
    protectKernelImage = true;
    
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
      execWheelOnly = true;
      extraConfig = ''
        Defaults timestamp_timeout=15
      '';
    };
    
    polkit.enable = true;
  };
  
  users.mutableUsers = true;  # Allow setting passwords with passwd
  
  # Kernel hardening
  boot.kernelParams = [ 
    "slab_nomerge" 
    "init_on_alloc=1" 
    "init_on_free=1" 
    "page_alloc.shuffle=1" 
  ];
  
  services.openssh = {
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      X11Forwarding = false;
    };
  };
  
  # Enable process isolation through namespaces
  nix.settings.sandbox = true;
}
