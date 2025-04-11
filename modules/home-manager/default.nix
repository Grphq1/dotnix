{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./system
    ./hyprland
    ./rofi
  ];
}
