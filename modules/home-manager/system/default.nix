{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./packages.nix
  ];
  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "alirezam";
    homeDirectory = "/home/alirezam";
  };

  home.file.".config/fish/omp.json".source = ../shell/imp.json;
}
