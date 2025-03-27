{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nixpkgs-unstable,
  ...
}:
let
  unstable = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
in
 {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "alirezam";
    homeDirectory = "/home/alirezam";
  };

  programs.chromium = {
    enable = true;
    package = pkgs.chromium.overrideAttrs (oldAttrs: {
      nativeBuildInputs = oldAttrs.nativeBuildInputs or [ ] ++ [ pkgs.makeWrapper ];
      postInstall = ''
        wrapProgram $out/bin/chromium \
          --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      '';
    });
  };

    programs.git = {
    enable = true;
    userName = "lorem10";
    userEmail = "momenei.alireza1382.15@gmail.com";
  };

    home.packages = with pkgs; [
    gcc

    htop
    spotify
    vscode
    
    unstable.neovim
    lua51Packages.luarocks
    lua51Packages.lua

    cava
    element-desktop
    wl-clipboard
    fishPlugins.z
    python3

    postman

    cargo

    lf

    neofetch
    kitty # terminal file manager
    wofi

    google-chrome

    font-awesome
    discord-ptb

    # Apps
    telegram-desktop
    yt-dlp
    vlc


    # archives
    zip
    xz
    unzip
    p7zip

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor


    btop # replacement of htop/nmon
    iftop # network monitoring


    # Wayland
    wl-clipboard
    grim
    swww
    slurp
    hyprpicker
    hyprpaper
    hypridle
    hyprlock
    brightnessctl

    tmux

    nodejs_22
    pnpm
  ];
  _module.args.unstable-pkgs = import <nixos-unstable> { };
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
