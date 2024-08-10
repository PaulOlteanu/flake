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
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  }: {
    homeConfigurations = {
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

          # TODO: Figure out how to get rid of this
          extraSpecialArgs = let
            stylix-theme = ./themes/one-dark.yaml;
          in {
            inherit stylix-theme;
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

          extraSpecialArgs = let
            stylix-theme = ./themes/one-dark.yaml;
          in {
            inherit stylix-theme;
          };
        };
    };
  };
}
