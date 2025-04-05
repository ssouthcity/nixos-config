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

  time.timeZone = "Europe/Oslo";

  # This setting is required for Windows Dual Boot.
  # NixOS attempts to set the hardware clock to UTC,
  # whereas Windows expects local time. Enabling this
  # setting synchronizes the two.
  time.hardwareClockInLocalTime = true;

  # Locale used for OS and applications
  i18n.defaultLocale = "en_US.UTF-8";

  # Override certain locales to use Norwegian standards
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nb_NO.UTF-8";
    LC_IDENTIFICATION = "nb_NO.UTF-8";
    LC_MEASUREMENT = "nb_NO.UTF-8";
    LC_MONETARY = "nb_NO.UTF-8";
    LC_NAME = "nb_NO.UTF-8";
    LC_NUMERIC = "nb_NO.UTF-8";
    LC_PAPER = "nb_NO.UTF-8";
    LC_TELEPHONE = "nb_NO.UTF-8";
    LC_TIME = "nb_NO.UTF-8";
  };

  # Enable Docker daemon and CLI
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
