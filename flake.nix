{
  description = "12urenloop website";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { flake-utils, nixpkgs, devshell, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [ devshell.overlays.default ];
        };
      in
      with pkgs; {
        devShells.default = pkgs.devshell.mkShell {
          imports = [ "${devshell}/extra/language/ruby.nix" ];
          packages = with pkgs; [
            nodejs
            yarn
          ];
          language.ruby = {
            package = pkgs.ruby_3_2;
            nativeDeps = with pkgs; [ zlib libyaml ];
          };
        };
      }
    );
}
