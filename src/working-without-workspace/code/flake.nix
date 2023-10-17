{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.devshell.url = "github:numtide/devshell";

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devshell.flakeModule ];

      systems = [ "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devshells.default = {
          packages = with pkgs; [ php82 php82Packages.composer ];
        };
      };

      flake = { };
    };
}
