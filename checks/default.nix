# All of this is taken directly from NobbZ' config
inputs: system: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  apkgs = inputs.alejandra.packages.${system};
  spkgs = inputs.statix.packages.${system};

  callPackage = pkgs.lib.callPackageWith (pkgs // apkgs // spkgs // {inherit (inputs) self;});
in {
  alejandra = callPackage ./alejandra.nix {};
  statix = callPackage ./statix.nix {};
}
