{
  pkgs,
  config,
  ...
}: {
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland.conf;
}
