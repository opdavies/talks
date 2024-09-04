{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      inherit (pkgs) mkShell nixfmt-classic;
    in
    {
      devShells.${system}.default = mkShell {
        packages = with pkgs; [
          ghostscript
          pdfpc
          python310Packages.rst2pdf
          texliveMedium # includes pdfjam
          tree
        ];
      };

      formatter.${system} = nixfmt-classic;
    };
}
