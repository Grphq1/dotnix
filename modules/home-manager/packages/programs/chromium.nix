# Chromium configuration with Wayland support
{pkgs, ...}: {
  programs.chromium = {
    enable = false; # Disabled in favor of other browsers
    package = pkgs.chromium.overrideAttrs (oldAttrs: {
      nativeBuildInputs = oldAttrs.nativeBuildInputs or [] ++ [pkgs.makeWrapper];
      postInstall = ''
        wrapProgram $out/bin/chromium \
          --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      '';
    });
  };
}
