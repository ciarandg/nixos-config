{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.ciaran.core;
in {
  options.ciaran.core = {
    enable = mkOption {
      description = "Whether to enable core settings";
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    nix.package = pkgs.nixUnstable;
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';

    users.mutableUsers = false;
    security.sudo.wheelNeedsPassword = false;

    time.timeZone = "America/Edmonton";

    nixpkgs.config.allowUnfree = true;

    system.autoUpgrade = {
      enable = true;
      flags = ["upgradeAll"];
    };

    nix.autoOptimiseStore = true;
    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 30d";
    };

    console = {
      earlySetup = true; # set TTY font size early in boot
      font = "ter-i20n"; # comfy size for 1080p, if 4k try "ter-i32b"
      packages = with pkgs; [terminus_font];
    };

    boot.supportedFilesystems = ["zfs"];
    services.zfs.autoScrub.enable = true;

    virtualisation.docker.enable = true;

    environment.variables = {
      EDITOR = "nvim";
    };

    environment.systemPackages = with pkgs; [
      home-manager
      git
      nix-index
      killall
      unzip
      zip
      unrar
      pciutils
      usbutils
      silver-searcher
      acpi
      openssl
      cryptsetup
      wireguard-tools
      dnsutils
      tree
      exfatprogs
      docker-compose
      alejandra
      statix
      xclip
      s3fs
      rclone
    ];
  };
}
