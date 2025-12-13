{pkgs, ...}: {
  programs.oh-my-posh.enable = true;

  programs.fish = {
    enable = true;

    functions.lfcd = ''
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

      set fish_default_key_bindings

      if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
        exec ${pkgs.niri}/bin/niri-session
      end
    '';
  };

  home.file = {
    ".config/fish/omp.json".source = ./imp.json;
  };
}
