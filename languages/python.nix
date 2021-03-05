{config, pkgs, ...} :
{
  home.packages = with pkgs.python39Packages; [
    pygments
  ];
}
