{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    defaultKeymap = "viins";
    enableCompletion = true;
    autocd = true;
    localVariables = {PATH = ''$PATH:$(find -L "$HOME/.local/bin/home/" | paste -sd ':')'';};
    shellAliases = {
      # Directory aliases
      docs = "$HOME/Documents";
      dls = "$HOME/Downloads";
      vids = "$HOME/Videos";
      music = "$HOME/Media/music";
      conf = "$HOME/.config";
      bin = "$HOME/.local/bin";
      src = "$HOME/.local/src";
      share = "$HOME/.local/share";
      hman = "$HOME/.config/nixpkgs";
      nos = "/etc/nixos";

      # Program aliases
      tmote = "transmission-remote";
      valgrind = "colour-valgrind";
      nconf = "sudo $EDITOR /etc/nixos/configuration.nix";
      ls = "lsd";
      hl = "hledger";
    };
    initExtra = ''
      autoload -U colors && colors
      PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)

      # Use vim keys in tab complete menu:
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history

      eval "$(direnv hook zsh)"
    '';
  };
}
