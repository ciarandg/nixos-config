{
  pkgs,
  config,
  lib,
  secrets,
  ...
}:
with lib; let
  cfg = config.ciaran.hostnames;
in {
  options.ciaran.hostnames = {
    enable = mkOption {
      description = "Whether to enable extra hostnames";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    networking.hosts = secrets.hosts;
  };
}
