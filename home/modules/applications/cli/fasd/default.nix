{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.fasd
    pkgs.fzf
  ];
  programs.zsh = {
    shellAliases = {
      x = "cd $(fasdzf)"; # cd with interactive selection
      v = "f -e $EDITOR"; # quick opening files with $EDITOR
    };
    initExtra = ''
      eval "$(fasd --init posix-alias zsh-hook)"
    '';
  };
}
