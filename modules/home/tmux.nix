{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        disableConfirmationPrompt = true;
        extraConfig = ''
            bind -r h select-pane -L
            bind -r j select-pane -D
            bind -r k select-pane -U
            bind -r l select-pane -R

            bind w split-window -h
            bind s split-window -v
        '';
    };
}
