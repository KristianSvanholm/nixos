{pkgs, config, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    disableConfirmationPrompt = true;
    shortcut = "a";
    newSession = true;
    keyMode = "vi";
    mouse = true;
    historyLimit = 50000;
    clock24 = true;
    baseIndex = 1;
    extraConfig = ''
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind v split-window -h
      bind s split-window -v

      bind | source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded"

      set-option -g status-position top
      set-option -g status-justify left

      set -g status-left ""
      set -g status-right ""

      set -g window-status-format " #I "
      set -g window-status-current-format "#[fg=#${config.lib.stylix.colors.base00},bg=#${config.lib.stylix.colors.${config.tint}}] #I #[default]"
      set -g window-status-separator ""

      # Make nvim healthcheck happy
      set-option -sg escape-time 10
      set-option -g focus-events on
      set-option -g default-terminal "tmux-256color"
      ## xterm-256color will probably not work everywhere.
      set -a terminal-features "xterm-256color:RGB"

      set -g detach-on-destroy off # Don't exit from tmux when closing a session

      # Auto-create window if it doesn't exist when selecting by number
      bind 1 if-shell 'tmux select-window -t :1' "" 'new-window -t :1'
      bind 2 if-shell 'tmux select-window -t :2' "" 'new-window -t :2'
      bind 3 if-shell 'tmux select-window -t :3' "" 'new-window -t :3'
      bind 4 if-shell 'tmux select-window -t :4' "" 'new-window -t :4'
      bind 5 if-shell 'tmux select-window -t :5' "" 'new-window -t :5'

    '';
  };

  programs.sesh = {
    enable = true;
    enableAlias = true;
    tmuxKey = "space";
    settings = {
    };
  };

  programs.fzf = {
    enable = true;
    tmux.enableShellIntegration = true;
  };
}
