# Shell configuration
{
  pkgs,
  username,
  ...
}: {
  programs.fish = {
    enable = true;
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
