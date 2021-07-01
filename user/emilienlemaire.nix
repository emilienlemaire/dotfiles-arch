{config, pkgs, ...}:

with pkgs;
{
  home.username = "emilienlemaire";

  programs.git = {
    enable = true;
    userEmail = "emilien.lem@icloud.com";
    userName = "Emilien Lemaire";
    signing.key = "F762F893588D6897DD8F6DF01FDAB38B9C3422F3";
    signing.signByDefault = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    initExtraBeforeCompInit = ''
      ${builtins.readFile ../dotfiles/zsh/zshrc}
    '';
    oh-my-zsh = {
      enable = true;
      custom = "\$HOME/.config/nixpkgs/dotfiles/zsh/custom";
      plugins = [
        "zsh-vim-mode"
        "git"
        "fast-syntax-highlighting"
      ];
    };
    shellAliases = {
      ssh = "kitty +kitten ssh";
    };
  };


  xdg.configFile = {
    "nvim" = {
      source = ../dotfiles/nvim;
      recursive = true;
    };
    "kitty" = {
      source = ../dotfiles/kitty;
      recursive = true;
    };
    "starship.toml".source = ../dotfiles/starship/starship.toml;
  };

  home.packages = with pkgs; [
    glpk
    gradle
    maven

    starship
    zsh-fast-syntax-highlighting
    font-awesome

    # docker

    # nodePackages.vscode-html-languageserver-bin

    # tree-sitter

    # glew
    # glfw3
  ];

}
