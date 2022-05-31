{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usbhid" "sdhci_pci"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e2454965-eb93-47ad-97a5-67227bf942f2";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/70D6-5C38";
    fsType = "vfat";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/45e074e5-4412-4551-8ca0-e1f46bb30ac7";}
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
