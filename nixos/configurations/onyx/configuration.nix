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

  networking.hostName = "onyx";
  networking.hostId = "2e6f54c6";

  ciaran.core.enable = true;
  ciaran.desktop.enable = true;
  ciaran.audio.enable = true;
  ciaran.development.enable = true;
  ciaran.users.enable = true;
  ciaran.hostnames.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };
}
