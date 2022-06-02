{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules
    ./filesystems
    ./vpn
  ];

  system.stateVersion = "20.09";

  networking.hostName = "ivy";

  ciaran.core.enable = true;
  ciaran.desktop = {
    enable = true;
    environment = "dwm";
  };
  ciaran.audio.enable = true;
  ciaran.development.enable = true;
  ciaran.users.enable = true;
  ciaran.vpn.enable = false;
  ciaran.hostnames.enable = true;

  # Graphics
  services.xserver = {
    dpi = 96;
    videoDrivers = ["modesetting"];
    libinput.enable = true;
  };
  hardware.opengl.enable = true;

  # Touchpad
  boot.kernelParams = ["psmouse.synaptics_intertouch=0"];
  services.xserver.libinput.touchpad = {
    tapping = true;
    scrollMethod = "twofinger";
    naturalScrolling = true;
    middleEmulation = false;
    horizontalScrolling = true;
    clickMethod = "clickfinger";
    accelSpeed = "0.5";
    accelProfile = "adaptive";
  };

  # Battery
  services.upower.enable = true;
  services.tlp.enable = true;

  # Boot
  boot.loader.systemd-boot.enable = true;

  # Network
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  services.tailscale.enable = true;

  services.transmission = {
    enable = true;
    user = "ciaran";
    home = "/home/ciaran";
  };
}
