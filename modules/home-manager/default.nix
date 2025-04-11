{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./system
    ./hyprland
    ./rofi
    ./waybar
  ];
}
