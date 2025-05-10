{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wezterm = {
      url = "github:wez/wezterm/9b2937b?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };

    helix = {
      url = "github:helix-editor/helix/7275b7f";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    niri-flake,
    ...
  } @ inputs: let
    overlays = [
      (_: prev: {wezterm = inputs.wezterm.packages.${prev.system}.wezterm;})
      (_: prev: {helix = inputs.helix.packages.${prev.system}.helix;})
    ];
  in {
    homeConfigurations = {
      "paul@neutron" = let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home/common.nix
            ./home/neutron.nix
            {
              nixpkgs.overlays = overlays;
            }
            niri-flake.homeModules.niri
          ];

          extraSpecialArgs = {
            inherit inputs;
          };
        };

      "paul@pop-os" = let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home/common.nix
            ./home/pop-os.nix
          ];

          extraSpecialArgs = {
            inherit inputs;
          };
        };

      "paul@macbook" = let
        system = "aarch64-darwin";
        pkgs = nixpkgs.legacyPackages.${system};
      in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home/common.nix
            ./home/macbook.nix
            {
              nixpkgs.overlays = overlays;
            }
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          extraSpecialArgs = {
            inherit inputs;
          };
        };
    };

    nixosConfigurations = {
      neutron = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            nix.settings = {
              substituters = ["https://cosmic.cachix.org/"];
              trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
            };
          }
          niri-flake.nixosModules.niri
          ./systems/neutron/configuration.nix
        ];
      };
    };
  };
}
