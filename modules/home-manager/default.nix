{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./system
    ./hyprland
  ];
}
