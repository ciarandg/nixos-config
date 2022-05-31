{
  config,
  pkgs,
  ...
}: let
  configPath = config.programs.rofi.configPath;
  windowConfig = "window { width: 100%; }";
in {
  programs.rofi = {
    enable = true;
    location = "top";
    font = "JetBrainsMono Nerd Font 12";
    theme = "gruvbox-dark";
    extraConfig = {
      disable-history = true;
    };
  };

  # Fortunately, this text gets appended to the config file
  home.file."${configPath}".text = windowConfig;

  home.packages = with pkgs; let
    dmenu = writeShellScriptBin "dmenu" "rofi -dmenu <&0";
    dmenu_run = writeShellScriptBin "dmenu_run" "rofi -show run";
  in [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
    dmenu
    dmenu_run
  ];
}
