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
      historySubstringSearch.enable = true;
    };
    zsh.plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    home-manager.enable = true;
  };

  home.file.".p10k.zsh".source = ./.p10k.zsh;

  programs.zsh.initExtraFirst = ''
    if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
      source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
    fi
  '';
  programs.zsh.initExtra = ''
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  '';

  services.ssh-agent.enable = true;

  home.stateVersion = "26.05";
}
