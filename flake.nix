{
  description = "AWS Diagram As Code";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.buildGoModule {
          doCheck = false;
          pname = "diagram-as-code";
          version = "0.21.6";
          src = pkgs.fetchFromGitHub {
            owner = "awslabs";
            repo = "diagram-as-code";
            rev = "v0.21.6";
            hash = "sha256-8CbdSg9pgwhzzVqdZwcaiBvnuAtM71wYVh8wM+K3nqw=";
          };
          #vendorHash = pkgs.lib.fakeHash;
          vendorHash = "sha256-hkHYISgHq6dcQvwgIFuSvDa5Xtym3P1HPd6KbRegfX0=";
        };
      }
    );
}
