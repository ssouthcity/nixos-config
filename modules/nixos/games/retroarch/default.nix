{ pkgs, ... }:
{
  services.xserver.desktopManager.retroarch.enable = true;

  environment.systemPackages = with pkgs; [
    (retroarch.override {
      cores = with libretro; [
        mupen64plus
        fceumm
      ];
    })
  ];
}
