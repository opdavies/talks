{
  inputs.devshell.url = "github:numtide/devshell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devshell.flakeModule ];

      systems = [ "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        formatter = pkgs.nixpkgs-fmt;

        devshells.default = {
          packages = with pkgs; [
            pdfpc
            python310Packages.rst2pdf
            tree
          ];
        };
      };
    };
}
