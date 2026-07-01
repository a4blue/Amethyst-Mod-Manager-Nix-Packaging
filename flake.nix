{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.x86_64-linux.native = pkgs.callPackage ./amethyst-mod-manager-native.nix { };

      packages.x86_64-linux.appimage = pkgs.callPackage ./amethyst-mod-manager-appimage.nix { };

      formatter.x86_64-linux = pkgs.nixfmt;
    };
}
