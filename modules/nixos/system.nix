# System-wide configuration
{pkgs, ...}: {
  time.timeZone = "Asia/Tehran";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    # Use only supported locales
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "C.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_TIME = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      warn-dirty = false;
    };
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "wezterm";
    };
    sessionVariables = {
      FLAKE = "/home/alirezam/nixos-config";
      NIXOS_OZONE_WL = "1"; # Enable Wayland support for Chrome/Electron apps
      MOZ_ENABLE_WAYLAND = "1";
      # Qt theming
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
      # GTK theming
      GTK_THEME = "adw-gtk3";
    };
    pathsToLink = ["/libexec"];
    # Enable system-wide fish shell completion for system packages
    systemPackages = with pkgs; [fishPlugins.done fishPlugins.fzf-fish];
  };

  # Shell configuration
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
  users.defaultUserShell = pkgs.fish;

  # System-wide sound configuration
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
