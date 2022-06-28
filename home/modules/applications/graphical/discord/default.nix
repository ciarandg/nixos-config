{
  config,
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.discord ];
  home.file = {
    ".config/discord/settings.json".source = ./settings.json;
  };
}
