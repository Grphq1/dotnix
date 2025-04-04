{
  pkgs,
  config,
  unstable,
  inputs,
  ...
}:let
  unstable = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
in {
  programs.chromium = {
    enable = true;
    package = pkgs.chromium.overrideAttrs (oldAttrs: {
      nativeBuildInputs = oldAttrs.nativeBuildInputs or [] ++ [pkgs.makeWrapper];
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

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wez = require('wezterm')
      return {
        enable_wayland   = true,
        scrollback_lines = 1024,
        bold_brightens_ansi_colors = true,
        harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
        color_scheme   = "followSystem",
        default_cursor_style = "SteadyUnderline",
        enable_scroll_bar    = false,
        warn_about_missing_glyphs = false,
        enable_tab_bar               = true,
        use_fancy_tab_bar            = false,
        hide_tab_bar_if_only_one_tab = true,
        show_tab_index_in_tab_bar    = false,
        window_close_confirmation = "NeverPrompt",
        inactive_pane_hsb         = {
          saturation = 1.0, brightness = 0.8
        },
        check_for_updates = false,
      }
    '';
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
    ranger
    nemo

    neofetch
    wofi

    google-chrome

    font-awesome
    discord-ptb

    telegram-desktop
    yt-dlp
    vlc
    mpv

    zip
    xz
    unzip
    p7zip


    nix-output-monitor

    btop
    iftop

    wl-clipboard
    grim
    swww
    slurp
    hyprpicker
    hypridle
    hyprlock
    brightnessctl

    tmux

    nodejs_22
    pnpm
    hyprpaper
    fastfetch

    grim
    slurp
  ];
}
