{
  config,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true; # enable Hyprland
  programs.hyprland.xwayland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    wget
    kitty
    firefox
    git
    openvpn
    oh-my-posh
  ];
}
