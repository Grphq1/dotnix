{...}: {
  imports = [
    ./env.nix
  ];
  xdg = {
    mimeApps = {
      enable = true;

      # Default applications for file types
      defaultApplications = {
        # Web - You have chromium, google-chrome, brave
        "text/html" = ["chromium.desktop"];
        "x-scheme-handler/http" = ["chromium.desktop"];
        "x-scheme-handler/https" = ["chromium.desktop"];

        # Documents - You don't have Evince explicitly installed
        "application/pdf" = ["evince.desktop"];

        # Images - You have feh installed
        "image/jpeg" = ["feh.desktop"];
        "image/png" = ["feh.desktop"];
        "image/gif" = ["feh.desktop"];

        # Video - You have mpv and vlc
        "video/mp4" = ["mpv.desktop"];
        "video/x-matroska" = ["mpv.desktop"];

        # Audio - You have mpv, vlc and spotify
        "audio/mpeg" = ["mpv.desktop"];
        "audio/flac" = ["mpv.desktop"];

        # Archives - You have zip, unzip, p7zip but no GUI tool like FileRoller
        "application/zip" = ["nemo.desktop"];
        "application/x-tar" = ["nemo.desktop"];
        "application/x-compressed-tar" = ["nemo.desktop"];

        # Text - You have vscode and neovim
        "text/plain" = ["code.desktop"];

        # Directory - You have nemo, lf, and ranger
        "inode/directory" = ["nemo.desktop"];
      };
    };
  };
}
