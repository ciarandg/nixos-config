{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    customPaneNavigationAndResize = true;

    # NOTE: prefix option should make this less clunky
    extraConfig = ''
      # rebind prefix to grave key
      unbind C-b
      set -g prefix `
      bind ` send-prefix

      # set status bar
      set -g status-bg black
      set -g status-fg white
      set -g status-left '#[fg=green]#H '
      set -g status-right-style fg=green

      set -g base-index 1

      # highlight active window
      set-window-option -g window-status-current-style bg=green,fg=black

      set -s escape-time 0
    '';

    plugins = with pkgs; [
      tmuxPlugins.pain-control
    ];
  };
}
