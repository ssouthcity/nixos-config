{ inputs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default

    ../common
  ];

  config = {
    wsl.enable = true;
    wsl.defaultUser = "southcity";

    networking.hostName = "nb-wsl";

    system.stateVersion = "23.11";
  };
}
