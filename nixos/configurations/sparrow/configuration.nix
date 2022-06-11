# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  secrets,
  ...
}: {
  imports = [
    ../../modules
  ];

  system.stateVersion = "22.05";

  networking.hostName = "sparrow";
  networking.hostId = "3160b79b";

  ciaran.core.enable = true;
  ciaran.desktop.enable = false;
  ciaran.audio.enable = false;
  ciaran.development.enable = false;
  ciaran.users.enable = true;
  ciaran.hostnames.enable = false;

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  networking.usePredictableInterfaceNames = false;
  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;
  services.tailscale.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Packages that Linode use for support
  environment.systemPackages = with pkgs; [
    inetutils
    mtr
    sysstat
  ];

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };
  users.users.ciaran.openssh.authorizedKeys.keyFiles = secrets.ssh.authorizedKeys."ciaran@sparrow";
}
