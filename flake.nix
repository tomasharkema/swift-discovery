{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = (import nixpkgs) {
        inherit system;
      };
      lib = nixpkgs.lib;
      stdenv = pkgs.stdenv;

      generated = pkgs.swiftpm2nix.helpers ./nix;
    in {
      packages = rec {
        default = swift-discovery;

        swift-discovery = pkgs.swiftPackages.stdenv.mkDerivation {
          pname = "swift-discovery";
          version = "0.0.1";

          src = ./.;

          nativeBuildInputs = with pkgs; [
            swift
            swiftpm
            pkg-config
            swift-format

            swiftPackages.Foundation
            swift-corelibs-libdispatch
          ];
          configurePhase = generated.configure;

          installPhase = ''
            runHook preInstall

            #This is a special function that invokes swiftpm to find the location
            # of the binaries it produced.
            binPath="$(swiftpmBinPath)"
            # Now perform any installation steps.
            mkdir -p $out/bin
            cp $binPath/swift-discovery $out/bin/

            runHook postInstall
          '';
        };
      };

      devShells.default = (pkgs.mkShell.override {stdenv = pkgs.swift.stdenv;}) {
        buildInputs = with pkgs; [
          swift
          swiftpm
          swiftpm2nix
          pkg-config
          swift-format
          swiftPackages.Foundation
          swift-corelibs-libdispatch
        ];
      };
    });
}
