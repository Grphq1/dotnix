{
  pkgs,
  config,
  ...
}: {
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.plugins = [
    pkgs.hyprlandPlugins.hyprgrass
  ];
  wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland.conf;
}
