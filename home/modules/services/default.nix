{...}: {
  imports = [./dunst ./dwm-status];

  services.syncthing.enable = true;

  services.mpd = {
    enable = true;
    musicDirectory = ~/Media/music;
  };
}
