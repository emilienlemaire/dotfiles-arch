{config, pkgs, ...}:

{
  home.username = "emilienlemaire";
  programs.git = {
    enable = true;
    userEmail = "emilien.lem@icloud.com";
    userName = "Emilien Lemaire";
    signing.key = "5D293308027D1A5F";
    signing.signByDefault = true;
  };

  xdg.configFile = {
    "nvim" = {
      source = ../dotfiles/nvim;
      recursive = true;
    };
  };
}
