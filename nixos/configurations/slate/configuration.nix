{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules
  ];

  system.stateVersion = "22.05";

  networking.hostName = "ivy";
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
  networking.interfaces.br-103db27de00f.useDHCP = true;
  networking.interfaces.br-25532359ee17.useDHCP = true;
  networking.interfaces.br-267f240ea4a7.useDHCP = true;
  networking.interfaces.br-51af09bb38fb.useDHCP = true;
  networking.interfaces.br-679ceb3dfbf5.useDHCP = true;
  networking.interfaces.br-9680dcbe6745.useDHCP = true;
  networking.interfaces.br-df98dc65e25d.useDHCP = true;
  networking.interfaces.br-fc33e1df1943.useDHCP = true;
  networking.interfaces.docker0.useDHCP = true;
  networking.interfaces.eth0.useDHCP = true;
  networking.interfaces.proxy-client.useDHCP = true;
  networking.interfaces.tailscale0.useDHCP = true;
  networking.interfaces.veth73d477c.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;
  services.tailscale.enable = true;

  services.sshd.enable = true;
}
