{
  config,
  pkgs,
  secrets,
  ...
}:
# NOTE: Startpage (~/.local/share/startpage.html) must be set manually
# using New Tab Redirect.
{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "ihlenndgcmojhcghmfjfneahoeklbjjh" # cVim
      "dhdgffkkebhmkfjojejmpbldmpobfkfo" # Tampermonkey
      "icpgjfneehieebagbmdbhnlpiopdcmna" # New Tab Redirect
    ];
  };

  home.file = {
    ".local/share/startpage.html".source = secrets.startpage;
  };
}
