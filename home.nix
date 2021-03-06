{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./role/darwin/index.nix
    ./user/emilienlemaire.nix
    ./languages/python.nix
    ./languages/perl.nix
    ./languages/llvm.nix
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  # Packages for everywhere
  home.packages = with pkgs; [
    # Utils
    bat
    highlight

    htop

    neuron-notes

    gnupg

    gnutls
    git
    lazygit

    wget

    neovim-nightly

    pkg-config

    # Dev
    luajit
    luarocks

    ninja

    go

    nodejs
    yarn

    rustup

    ocaml
    opam

    perl

    python39

    ruby
    # cmake
    # cmakeWithGui

    #cpp
    abseil-cpp
    catch2
    grpc
    ncurses

    #llvm
    # TODO: Find a fix to make it work
    # llvm_11
    #clang_11
    #clang-tools
    # lld
    # libcxx
    # libcxxabi

    #GNU Build
    autoconf
    automake
    #gcc
    #gdb

    #lsp
    rnix-lsp
    texlab
  ];
}
