# System-wide packages and programs
{pkgs, ...}: {
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/alirezam/dotnix";
    };

    # remove from new nixpkgs version
    throne = {
      enable = true;
      tunMode.enable = true;
    };

    proxychains = {
      enable = true;
      proxies = {
        myproxy = {
          enable = true;
          type = "socks5";
          host = "127.0.0.1";
          port = 2080;
        };
      };
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    vazir-fonts
    fira-code
    jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    # System utilities
    git
    mangohud
    gnupg

    # Browser
    firefox

    # Nvim config
    nvim-pkg

    # VPN and network security
    openvpn
    wireguard-tools

    # Auto-mount tools
    udevil
    jmtpfs
    libmtp

    # Security tools
    keepassxc
    pass
    seahorse
    firejail
    usbguard

    # Gaming and graphics tools
    vulkan-tools
    mesa-demos # Provides glxinfo
    libva-utils # Provides vainfo for checking VA-API support
  ];
}
