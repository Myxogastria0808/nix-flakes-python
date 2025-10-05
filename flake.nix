{
  description = "python flake sample";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        pythonPackages = with pkgs.python313Packages; [
          numpy
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ python313 ] ++ pythonPackages;
        };
      }
    );
}