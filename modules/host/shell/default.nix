{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fish.nix
  ];
  # default shell for all users
  users.defaultUserShell = pkgs.fish;
}
