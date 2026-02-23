{
  description = "Alireza's NixOS Configuration";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://niri.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };

  inputs = {
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
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
    determinate,
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
          determinate.nixosModules.default
          {
            nix.settings.trusted-users = ["alirezam"];
          }
        ];
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;

          overlays = [
            nvix.overlays.default
            inputs.niri.overlays.niri
          ];
        };
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#${username}@${hostname}'
    homeConfigurations = {
      "${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            inputs.niri.overlays.niri
          ];
        };
        extraSpecialArgs = specialArgs;
        modules = [
          ./home/${username}/home.nix
        ];
      };
    };
  };
}
