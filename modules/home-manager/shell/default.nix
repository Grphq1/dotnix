# Shell configuration
{pkgs, ...}: {
  programs.fish = {
    enable = true;
    functions.lfcd = ''
      # `command` is needed in case `lfcd` is aliased to `lf`.
      # Quotes will cause `cd` to not change directory if `lf` prints nothing to stdout due to an error.
      cd "$(command lf -print-last-dir $argv)"
    '';
    interactiveShellInit = ''
      # Disable greeting
      set fish_greeting

      # Initialize oh-my-posh
      oh-my-posh init fish --config ~/.config/fish/omp.json | source

      # Aliases
      alias pn=pnpm
      alias todo=todo.sh

      # Use default key bindings
      set fish_default_key_bindings

      # Auto-start Niri on tty1
      if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
        exec ${pkgs.niri}/bin/niri-session
      end
    '';
  };

  # Configuration files
  home.file = {
    ".config/fish/omp.json".source = ./imp.json;
  };
}
