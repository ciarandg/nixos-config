{
  config,
  pkgs,
  ...
}: {
  programs.beets = {
    enable = true;
    settings = {
      import = {
        directory = "~/Media/music";
        library = "~/beets/musiclibrary.db";

        move = false;
        autotag = true;
      };
      asciify_paths = true;
      plugins = "discogs";
    };
  };
}
