{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./beets
    ./fasd
    ./gdb
    ./git
    ./htop
    ./latex
    ./lf
    ./ncmpcpp
    ./neovim
    ./taskwarrior
    ./tmux
    ./valgrind
  ];

  home.packages = with pkgs; [
    perlPackages.vidir
    lsd
    mpc_cli
    ueberzug
    hledger
    neofetch
    file
    htop
    tremc
    weechat
    ffmpeg
    fzf
    perlPackages.vidir
    sox
    sanoid
    ncdu
    poppler_utils
  ];
}
