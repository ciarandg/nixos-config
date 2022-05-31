{
  config,
  pkgs,
  ...
}: {
  programs.taskwarrior = {
    enable = true;

    config = {
      dateformat = "M-D";
      data.location = "~/.task";
    };
  };

  home.packages = [
    pkgs.vit
  ];
}
