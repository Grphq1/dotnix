# NixOS modules export
{
  # Export default combined module
  imports = [
    ./boot.nix
    ./networking.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./users.nix
    ./virtualization.nix
    ./packages.nix
  ];
}
