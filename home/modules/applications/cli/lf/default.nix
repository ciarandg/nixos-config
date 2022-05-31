{
  config,
  pkgs,
  ...
}: let
  commandsDir = ./commands;
in {
  programs.lf = {
    enable = true;
    settings = {
      shell = "zsh";
      shellopts = "-eu";
      ifs = "\n";
      scrolloff = 10;
      period = 1;
      icons = true;
    };
    commands = {
      mkdir = builtins.readFile "${commandsDir}/mkdir";
      extract = builtins.readFile "${commandsDir}/extract";
      delete = builtins.readFile "${commandsDir}/delete";
      moveto = builtins.readFile "${commandsDir}/moveto";
      copyto = builtins.readFile "${commandsDir}/copyto";
      open = builtins.readFile "${commandsDir}/open";
      open-with = ''&$@ $fx''; # ampersand denotes asynchronicity
      go-home = "$lf -remote \"send $id cd ~\"";
      fasd_dir = builtins.readFile ./commands/fasd_dir;
      bulkrename-selected = "$printf '%s\\n' $fx | vidir -";
      bulkrename = "$vidir";
      shell-env = "$\$SHELL";
    };
    keybindings = {
      "<c-n>" = "push :mkdir<space>";
      "<c-r>" = "reload";
      "<c-s>" = "set hidden!";
      "<enter>" = "shell";
      "+" = "shell-env";
      "`" = "push :open-with<space>";
      "," = "go-home";
      x = "fasd_dir";
      g = "top";
      D = "delete";
      E = "extract";
      C = "copyto";
      M = "moveto";
      V = "push :!nvim<space>";

      A = "rename"; # append
      c = "push A<c-u>"; # rename from scratch
      I = "push A<c-a>"; # prepend
      i = "push A<a-b><a-b><a-f>"; # before extension
      a = "push A<a-b>"; # after extension
      b = "bulkrename-selected";
      B = "bulkrename";
    };
  };

  # NOTE: Icons variable contains NerdFonts glyphs
  home.sessionVariables = {
    LF_ICONS = import ./icons.nix;
  };
}
