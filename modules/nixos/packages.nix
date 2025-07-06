# System-wide packages and programs
{
  config,
  pkgs,
  ...
}: {
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/alirezam/nixos-config";
    };

    # Gaming
    gamescope = {
      enable = true;
      capSysNice = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };

    nekoray = {
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
    oh-my-posh
    gnupg

    # Browser
    firefox

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
  ];
}
