{config, lib, pkgs, ... }:

{
  home.homeDirectory = "/Users/emilienlemaire";

  home.packages = with pkgs; [
    bash
  ];

  xdg.configFile = {
    "yabai" = {
      source = ../../dotfiles/yabai;
      recursive = true;
    };
    "skhd" = {
      source = ../../dotfiles/skhd;
      recursive = true;
    };
  };
}
