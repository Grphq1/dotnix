{
  config,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true; # enable Hyprland
  programs.hyprland.xwayland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.proxychains = {
    enable = true;
    proxies = {
      myproxy = {
        enable = true;
        type = "socks5";
        host = "127.0.0.1";
        port = 1080;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    kitty
    firefox
    git
    openvpn
    oh-my-posh

    # auto mount
    udevil
    jmtpfs
    libmtp
  ];
}
