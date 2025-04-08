{ inputs, ... }:
{
  # Garbage collect NixOS generations
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d";
    persistent = true;
    randomizedDelaySec = "1h";
  };

  # Optimize the Nix store by hardlinking packages
  nix.optimise = {
    automatic = true;
    dates = [ "daily" ];
    persistent = true;
    randomizedDelaySec = "1h";
  };

  # Link named references to nixpkgs to the upstream input
  nix.registry = {
    nixpkgs.flake = inputs.nixpkgs;
  };

  # Enable Nix flakes
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

}
