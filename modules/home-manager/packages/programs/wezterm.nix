# WezTerm terminal configuration
{pkgs, ...}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wez = require('wezterm')

      return {
        -- Transparency settings
        window_background_opacity = 0.89,
        text_background_opacity = 0.89,

        -- Wayland support
        enable_wayland = true,

        -- Scrollback and behavior
        scrollback_lines = 1024,
        bold_brightens_ansi_colors = true,
        check_for_updates = false,
        window_close_confirmation = "NeverPrompt",

        -- Font configuration
        harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
        font = wez.font("Fira Code"),
        font_size = 12.0,

        -- Color scheme
        color_scheme = "followSystem",
        colors = {
          foreground = "#E6E6E6",
          background = "#000",
          cursor_bg = "#64B4FF",
          cursor_border = "#64B4FF",
          cursor_fg = "#1E1E1E",
          selection_bg = "#3264C8",
          selection_fg = "#FFFFFF",

          -- ANSI colors
          ansi = {
            "#1E1E1E", -- black
            "#B43232", -- red
            "#5FAF5F", -- green
            "#D7AF5F", -- yellow
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

        -- Cursor configuration
        default_cursor_style = "SteadyUnderline",

        -- UI settings
        enable_scroll_bar = false,
        warn_about_missing_glyphs = false,
        enable_tab_bar = true,
        use_fancy_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        show_tab_index_in_tab_bar = false,

        -- Pane settings
        inactive_pane_hsb = {
          saturation = 1.0,
          brightness = 0.8
        },
      }
    '';
  };
}
