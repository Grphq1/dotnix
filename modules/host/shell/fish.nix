{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      oh-my-posh init fish --config ~/.config/fish/omp.json | source
      alias pn=pnpm
    '';
  };
}
