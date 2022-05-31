{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Ciaran De Groot";
    userEmail = "ciaran.deg@gmail.com";
    extraConfig = {
      diff.tool = "vimdiff";
      merge.tool = "vimdiff";
      difftool.prompt = false;
    };
  };
}
