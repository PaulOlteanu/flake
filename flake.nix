{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixos-cosmic = {
    #   url = "github:lilyinstarlight/nixos-cosmic";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: {
    homeConfigurations = let
      # TODO: Figure out how to not need this here
      stylix-theme = ./themes/one-dark.yaml;
    in {
      "paul@nixos" = let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            stylix.homeManagerModules.stylix
            ./home/common.nix
            ./home/nixos.nix
          ];

          extraSpecialArgs = {
            inherit stylix-theme;
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
            stylix.homeManagerModules.stylix
            ./home/common.nix
            ./home/pop-os.nix
          ];

          extraSpecialArgs = {
            inherit stylix-theme;
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
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          extraSpecialArgs = {
            # inherit stylix-theme;
            inherit inputs;
          };
      };
    };

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # {
          #   nix.settings = {
          #     substituters = ["https://cosmic.cachix.org/"];
          #     trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
          #   };
          # }
          # nixos-cosmic.nixosModules.default

          ./systems/nixos/configuration.nix
        ];
      };
    };
  };
}
