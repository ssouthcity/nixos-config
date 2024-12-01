{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (retroarch.withCores (cores: with cores; [
      fceumm
      parallel-n64
    ]))
  ];
}
