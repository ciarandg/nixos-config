{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./core
    ./desktop
    ./audio
    ./development
    ./users
    ./hostnames
  ];
}
