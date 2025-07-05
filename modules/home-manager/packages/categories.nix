# Package categories for better organization
{ pkgs, inputs, ... }:

let
  # Import unstable packages
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  # Audio packages
  audio = with pkgs; [
    pulseaudio
    pavucontrol
  ];
  
  # Browser packages
  browsers = with pkgs; [
    google-chrome
    brave
  ];
  
  # Development packages
  development = with pkgs; [
    # Languages and runtimes
    gcc
    python3
    nodejs_22
    pnpm
    cargo
    lua51Packages.luarocks
    lua51Packages.lua
    
    # Editors and IDEs
    neovim
    vscode
    code-cursor
  ];
  
  # Gaming packages
  games = with pkgs; [
    lutris
  ];
  
  # Media packages
  media = with pkgs; [
    yt-dlp
    vlc
    mpv
    spotify
  ];
  
  # Office packages
  office = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en-us
    gnome-calculator
  ];
  
  # System utilities
  system = with pkgs; [
    htop
    neofetch
    fastfetch
    tmux
    
    # Archive tools
    zip
    xz
    unzip
    p7zip
    
    # Nix tools
    nix-output-monitor
    nix-du
    nix-melt
    graphviz  # For nix-du visualization
  ];
  
  # General utilities
  utilities = with pkgs; [
    # File managers
    lf
    ranger
    nemo
    
    # CLI tools for lf
    chafa  # Image preview
    file   # File type detection
    
    # Terminal emulators
    kitty
    
    # System tools
    dunst
    distrobox
    
    # Communication
    telegram-desktop
    
    # VPN
    v2rayn
    
    # Shell plugins
    fishPlugins.z
  ];
  
  # Wayland/Niri specific packages
  wayland = with pkgs; [
    # Core Wayland tools
    wl-clipboard
    xwayland-satellite  # For X11 app support
    
    # Niri ecosystem
    niri
    wvkbd       # Virtual keyboard
    swww        # Wallpaper daemon
    feh         # Image viewer
    
    # Application launcher and bar
    rofi-wayland
    waybar
    
    # Waybar dependencies
    fzf
    brightnessctl
    playerctl
    
    # Fonts
    font-awesome
  ];
  
  # OBS Studio with plugins
  obs = {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
}
