{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  inputs.nixos-hardware.url = "github:NixOS/nixos-hardware";
  inputs.musnix.url = "github:musnix/musnix";

  inputs.alejandra.url = "github:kamadorueda/alejandra/1.3.0";
  inputs.alejandra.inputs.nixpkgs.follows = "nixpkgs";

  inputs.statix.url = "github:nerdypepper/statix";
  inputs.statix.inputs.nixpkgs.follows = "nixpkgs";

  inputs.secrets.url = "git+ssh://git@github.com/ciarandg/secrets.git";
  inputs.secrets.inputs.nixpkgs.follows = "nixpkgs";

  inputs.comp58.url = "github:ciarandg/comp58";
  inputs.comp58.inputs.nixpkgs.follows = "nixpkgs";
  inputs.pw-viz.url = "github:ciarandg/pw-viz";
  inputs.pw-viz.inputs.nixpkgs.follows = "nixpkgs";

  outputs = {
    self,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = import ./nixos/configurations inputs;
    homeConfigurations = import ./home/configurations inputs;
    checks."x86_64-linux" = import ./checks inputs "x86_64-linux";
    checks."aarch64-linux" = import ./checks inputs "aarch64-linux";
  };
}
