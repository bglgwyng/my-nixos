{ pkgs, ... }:
{
  home = {
    username = "bglgwyng";
    homeDirectory = "/home/bglgwyng";
  };

  home.packages = [
    pkgs.claude-code
    pkgs.devenv
    pkgs.gh
  ];

  programs = {
    git = {
      enable = true;
      userName = "bgl gwyng";
      userEmail = "bgl@gwyng.com";
      difftastic.enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      autocd = true;
    };
    zsh.plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    home-manager.enable = true;
    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home.file.".p10k.zsh".source = ./.p10k.zsh;

  programs.zsh = {
    initExtraFirst = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';
    initExtra = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      autoload -U up-line-or-beginning-search down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey '^[[A' up-line-or-beginning-search
      bindkey '^[[B' down-line-or-beginning-search
      bindkey '^[OA' up-line-or-beginning-search
      bindkey '^[OB' down-line-or-beginning-search
    '';
  };

  services.ssh-agent.enable = true;

  home.stateVersion = "26.05";
}
