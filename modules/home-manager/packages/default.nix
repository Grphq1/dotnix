# Main package configuration
{ pkgs, config, inputs, ... }:

let
  categories = import ./categories.nix { inherit pkgs inputs; };
in {
  imports = [
    ./programs
  ];
  
  # Allow unfree packages
  nixpkgs = {
    overlays = [ ];
    config.allowUnfree = true;
  };
  
  # Install packages by category
  home.packages = with categories; 
    audio ++
    browsers ++
    development ++
    games ++
    media ++
    office ++
    system ++
    utilities ++
    wayland;
}
