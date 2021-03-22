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
  ];
}
