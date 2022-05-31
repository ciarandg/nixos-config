{
  config,
  pkgs,
  ...
}: let
  configDir = ./config;
  # ncmpcpp-ueberzug requires a blank visualizer column to place album art on
  ncmpcpp = pkgs.ncmpcpp.override {visualizerSupport = true;};
in {
  home.packages = [ncmpcpp];
  home.file = {
    ".local/bin/home/ncmpcpp-ueberzug"  .source = "${configDir}/ncmpcpp-ueberzug/ncmpcpp-ueberzug";
    ".config/ncmpcpp"                   .source = "${configDir}";
  };
}
