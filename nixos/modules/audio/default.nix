{
  config,
  pkgs,
  lib,
  pw-viz,
  ...
}:
with lib; let
  cfg = config.ciaran.audio;
in {
  options.ciaran.audio = {
    enable = mkOption {
      description = "Whether to enable audio";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    environment.systemPackages = [pw-viz];

    # Override pkgs.pulseaudio to support ALSA in OpenAL
    environment.etc."openal/alsoft.conf".source = lib.mkForce ./alsoft.conf;
  };
}
