{
  self,
  nixpkgs,
  nixos-hardware,
  ...
} @ inputs:
nixpkgs.lib.nixosSystem {
  system = "aarch64-linux";
  specialArgs = inputs;
  modules = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
