{
  pkgs,
  config,
  unstable,
  inputs,
  ...
}: let
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
        window_background_opacity = 0.89,
        text_background_opacity = 0.89,
        enable_wayland   = true,
        scrollback_lines = 1024,
        bold_brightens_ansi_colors = true,
        harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
        color_scheme   = "followSystem",
        colors = {
          foreground = "#E6E6E6",
          background = "#1E1E1E",
          cursor_bg = "#64B4FF",
          cursor_border = "#64B4FF",
          cursor_fg = "#1E1E1E",

          selection_bg = "#3264C8",
          selection_fg = "#FFFFFF",

          ansi = {
            "#1E1E1E", -- black
            "#B43232", -- red
            "#5FAF5F", -- green (custom می‌تونیم تغییر بدیم)
            "#D7AF5F", -- yellow (custom)
            "#3264C8", -- blue
            "#AF5FD7", -- magenta
            "#64B4FF", -- cyan
            "#E6E6E6", -- white
          },
          brights = {
            "#3A3A3A", -- bright black
            "#FF5F5F", -- bright red
            "#87D787", -- bright green
            "#FFD787", -- bright yellow
            "#5F87FF", -- bright blue
            "#D787FF", -- bright magenta
            "#87D7FF", -- bright cyan
            "#FFFFFF", -- bright white
          },
        },
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
    rofi-wayland
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
