{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.lutris-free
    pkgs.gnome3.adwaita-icon-theme
    # if steam games aren't running, add "steam-run " as a prefix in steam launcher settings
    pkgs.steam-run
  ];
}
