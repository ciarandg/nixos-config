{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.gdb];
  home.file = {".gdbinit".source = ./gdbinit;};
}
