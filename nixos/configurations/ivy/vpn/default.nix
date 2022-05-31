{
  pkgs,
  config,
  lib,
  secrets,
  ...
}:
with lib; let
  cfg = config.ciaran.vpn;
in {
  options.ciaran.vpn = {
    enable = mkOption {
      description = "Whether to enable vpn settings";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    networking.nat.enable = true;
    networking.nat.externalInterface = "enp0s31f6";
    networking.nat.internalInterfaces = ["wg0"];
    networking.firewall = {
      allowedUDPPorts = [51820];
    };

    environment.systemPackages = with pkgs; [
      # mullvad-vpn
      wireguard-tools
    ];

    networking.wireguard.enable = true;

    networking.wg-quick = {
      interfaces = secrets.mullvad.interfaces;
    };
  };
}
