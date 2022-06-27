{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.ciaran.desktop;
  env = config.ciaran.desktop.environment;
  envSwitch = ifDwm: ifXmonad:
    if env == "dwm"
    then ifDwm
    else if env == "xmonad"
    then ifXmonad
    else throw "Invalid environment";
in {
  options.ciaran.desktop.environment = mkOption {
    description = "Which window manager to use (dwm or xmonad)";
    type = types.enum ["dwm" "xmonad"];
    default = "dwm";
  };

  config = mkIf cfg.enable {
    services.xserver = let
      session = envSwitch "none+dwm" "none+xmonad"; in {
      enable = true;
      layout = "us";
      xkbOptions = "caps:escape";
      displayManager = {
        lightdm = {
          enable = true;
          extraConfig = ''
            [SeatDefaults]
            user-session=${session}
          '';
          greeters.mini = {
            enable = true;
            user = "ciaran";
            extraConfig = ''
              [greeter]
              show-password-label = false
              show-input-cursor = true
              password-alignment = right
              invalid-password-text =
            '';
          };
          background = ./wallpapers/login.png;
        };
        defaultSession = session;
        sessionCommands = ''
          light-locker --lock-on-suspend --lock-on-lid &
          feh --bg-scale ${./wallpapers/desktop.png}
        '';
      };
      windowManager =
        envSwitch
        {dwm.enable = true;}
        {
          xmonad.enable = true;
          xmonad.enableContribAndExtras = true;
        };
    };

    environment.systemPackages = with pkgs; [lightlocker feh] ++ envSwitch [] [xmobar];

    nixpkgs.overlays = envSwitch [
      (self: super: {
        dwm = super.dwm.overrideAttrs (oa: {
          src = builtins.fetchGit {
            url = "https://github.com/ciarandeg/dwm.git";
            ref = "master";
            rev = "37ddea6d1faacf764053e083c97af2b9982723f1";
          };
        });
      })
    ] [];
  };
}
