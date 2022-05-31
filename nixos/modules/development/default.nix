{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.ciaran.development;
in {
  options.ciaran.development = {
    enable = mkOption {
      description = "Whether to enable development settings";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    environment.variables = {
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };

    services.lorri.enable = true;

    environment.systemPackages = with pkgs; [
      niv
      direnv
      rnix-lsp

      gcc
      cmake
      gnumake
      R
      gdb
      valgrind

      yarn
      nodejs
      hugo

      rustc
      cargo

      poetry
      black
      python
      python3

      cabal-install
      cabal2nix
      haskell-language-server
      ghc
      stack

      faust
    ];
  };
}
