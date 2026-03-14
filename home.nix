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
    starship.enable = true;
    home-manager.enable = true;
  };

  home.stateVersion = "26.05";
}
