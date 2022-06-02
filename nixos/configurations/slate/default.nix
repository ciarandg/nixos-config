{
  self,
  nixpkgs,
  nixos-hardware,
  ...
} @ inputs: system:
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = inputs;
  modules = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
