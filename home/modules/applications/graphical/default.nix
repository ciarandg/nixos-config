{
  config,
  pkgs,
  comp58,
  ...
} @ inputs: {
  imports = [
    ./chromium
    ./idea
    ./lutris
    ./rofi
  ];

  home.packages = with pkgs; [
    # Media
    mpv
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
    discord

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
