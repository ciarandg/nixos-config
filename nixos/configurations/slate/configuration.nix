{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules
  ];

  system.stateVersion = "22.05";

  networking.hostName = "slate";
  networking.hostId = "4cbaa6ae";

  ciaran.core.enable = true;
  ciaran.desktop.enable = false;
  ciaran.audio.enable = false;
  ciaran.development.enable = false;
  ciaran.users.enable = true;
  ciaran.hostnames.enable = true;

  # Battery
  services.upower.enable = true;
  services.tlp.enable = true;

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  # Network
  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;
  services.tailscale.enable = true;

  services.sshd.enable = true;
}
