{
  self,
  nixpkgs,
  nixos-hardware,
  ...
} @ inputs: let
  mkSystem = {
    system,
    specialArgs,
    modules,
  }:
    nixpkgs.lib.nixosSystem {
      inherit system specialArgs modules;
    };
in {
  ivy = mkSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      ./ivy/configuration.nix
      ./ivy/hardware-configuration.nix
      nixos-hardware.nixosModules.lenovo-thinkpad-x1-extreme-gen2
    ];
  };
  slate = mkSystem {
    system = "aarch64-linux";
    specialArgs = inputs;
    modules = [
      ./slate/configuration.nix
      ./slate/hardware-configuration.nix
    ];
  };
  sparrow = mkSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      ./sparrow/configuration.nix
      ./sparrow/hardware-configuration.nix
    ];
  };
}
