{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    disableConfirmationPrompt = true;
    shortcut = "a";
    newSession = true;
    clock24 = true;
    baseIndex = 1;
    extraConfig = ''
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind v split-window -h
      bind s split-window -v

      set-option -g status-position top
      set-option -g status-justify centre

      set -g detach-on-destroy off # Don't exit from tmux when closing a session
    '';
  };

  programs.sesh = {
    enable = true;
    tmuxKey = "space";
    settings = {
    };
  };

  programs.fzf = {
    enable = true;
    tmux.enableShellIntegration = true;
  };
}
