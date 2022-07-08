{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  config = {
    boot.zfs.extraPools = ["onyx-pool"];
  };
}
