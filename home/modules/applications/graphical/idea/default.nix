{
  config,
  pkgs,
  ...
}: let
  upkgs = import ../../upkgs.nix;
in {
  home.packages = [
    pkgs.jetbrains.idea-community
    pkgs.jdk17
    pkgs.kotlin
  ];

  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1"; # needed for dwm compatibility
  };
}
