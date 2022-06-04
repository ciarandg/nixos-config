{
  self,
  nixpkgs,
  nixos-hardware,
  ...
} @ inputs:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = inputs;
  modules = [
    ./configuration.nix
    ./hardware-configuration.nix
    nixos-hardware.nixosModules.lenovo-thinkpad-x1-extreme-gen2
  ];
}
