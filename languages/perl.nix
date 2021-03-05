{config, pkgs, ...}:
{
  home.packages = with pkgs.perl532Packages; [
    CPAN
  ];
}
