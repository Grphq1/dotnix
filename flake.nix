{
  description = "Alireza's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvix = {
      url = "github:Grphq1/nvix";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = ["x86_64-linux"];

    username = "alirezam";
    hostname = "nixos";
    system = "x86_64-linux";

    myLib = import ./lib {inherit (nixpkgs) lib;};

    forAllSystems = nixpkgs.lib.genAttrs systems;

    specialArgs = {
      inherit inputs outputs myLib username hostname;
    };
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#${hostname}'
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = specialArgs;
        modules = [
          ./hosts/${hostname}/configuration.nix
        ];
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;

          overlays = [
            nvix.overlays.default
          ];
        };
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#${username}@${hostname}'
    homeConfigurations = {
      "${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = specialArgs;
        modules = [
          ./home/${username}/home.nix
        ];
      };
    };
  };
}
