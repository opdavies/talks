{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      inherit (pkgs) mkShell nixfmt-classic;
    in {
      devShells.${system}.default = mkShell {
        packages = with pkgs; [
          ghostscript
          just
          pdfpc
          python310Packages.rst2pdf
          tree
        ];
      };

      formatter.${system} = nixfmt-classic;
    };
}
