{
  config,
  pkgs,
  lib,
  secrets,
  ...
}:
with lib; let
  cfg = config.ciaran.users;
in {
  options.ciaran.users = {
    enable = mkOption {
      description = "Whether to enable users";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    users.users.ciaran = {
      isNormalUser = true;
      extraGroups = ["wheel" "adm" "networkmanager" "audio" "libvirtd" "docker"];
      hashedPassword = secrets.hashedPasswords.ciaran;
      shell = pkgs.zsh;
    };
  };
}
