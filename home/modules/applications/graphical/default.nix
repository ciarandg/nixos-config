{
  config,
  pkgs,
  comp58,
  ...
} @ inputs: {
  imports = [
    ./chromium
    ./discord
    ./idea
    ./latex
    ./lutris
    ./rofi
  ];

  home.packages = with pkgs; [
    # Media
    mpv
    jellyfin-mpv-shim
    jellyfin-media-player
    syncplay
    steam
    calibre
    audacity
    reaper
    aseprite
    musescore
    krita

    # Productivity/Social
    thunderbird
    obsidian
    zoom-us
    slack
    libreoffice
    element-desktop

    # Dev
    vscode

    # Utility
    libnotify
    monero-gui
    pavucontrol
    mupdf
    sxiv
    scrot
    qdirstat
    comp58
  ];
}
