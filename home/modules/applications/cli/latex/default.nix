{
  config,
  pkgs,
  ...
}: let
  texlive = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium titlesec titling;
  };
in {
  home.packages = [
    texlive
    pkgs.texlab
  ];
}
