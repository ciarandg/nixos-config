{
  config,
  pkgs,
  lib,
  ...
}: let
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  home.file = {
    # symlinks that really mostly should be proper mounts
    ".local/bin/home/scripts"       .source = ./scripts; # TODO encrypt these
    "Bitwig Studio"                 .source = symlink /mnt/acai/docs/bitwig;
    "Documents"                     .source = symlink /mnt/acai/docs;
    "Media"                         .source = symlink /mnt/acai/media;
    ".ssh"                          .source = symlink /mnt/acai/credentials/ssh;
    ".gnupg"                        .source = symlink /mnt/acai/credentials/gnupg;
    ".local/share/Steam/steamapps"  .source = symlink /mnt/acai/games/steam/steamapps;
    ".local/share/multimc"          .source = symlink /mnt/acai/games/multimc;
    ".hledger.journal"              .source = symlink /mnt/acai/docs/finance/hledger.journal;
  };
}
