{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./system
    ./shell
  ];
}
