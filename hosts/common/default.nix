{
  imports = [
    ./i18n.nix
    ./nix.nix
    ./time.nix
    ./virtualisation.nix
  ];

  programs.dconf.enable = true;
}
