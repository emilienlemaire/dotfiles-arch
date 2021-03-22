{config, lib, pkgs, ... }:

{
  home.homeDirectory = "/Users/emilienlemaire";

  home.packages = with pkgs; [
    bash
  ];
}
