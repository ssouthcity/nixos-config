{ inputs, outputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default

    outputs.nixosModules.default
  ];

  config = {
    wsl.enable = true;
    wsl.defaultUser = "southcity";

    networking.hostName = "nb-wsl";

    system.stateVersion = "23.11";
  };
}
