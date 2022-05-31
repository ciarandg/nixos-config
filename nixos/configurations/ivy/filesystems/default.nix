{
  pkgs,
  config,
  lib,
  secrets,
  ...
}:
with lib; {
  config = {
    networking.hostId = "83a4d73c"; # per-device value

    boot.zfs.extraPools = ["thinkpool"];
    boot.zfs.requestEncryptionCredentials = ["thinkpool/acai"];

    services.cron = {
      enable = true;
      systemCronJobs = [
        "* * * * *    root    TZ=UTC sanoid --cron"
      ];
    };

    environment.etc."sanoid/sanoid.conf".source = lib.mkForce ./sanoid.conf;

    fileSystems."/nix" = {
      device = "/dev/disk/by-label/nix";
      fsType = "ext4";
      neededForBoot = true;
      options = ["noatime"];
    };

    fileSystems."/mnt/getcooking" = secrets.sambaShares.getCooking;
  };
}
