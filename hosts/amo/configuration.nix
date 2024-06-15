{ config, pkgs, inputs, ... }:

{
  imports = [
      ../../modules/nixos
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      inputs.nixos-hardware.nixosModules.lenovo-legion-15ach6h
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "amo";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Oslo";

  i18n.defaultLocale = "en_US.UTF-8";

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

  services.xserver = {
    enable = true;
    xkb = {
      layout = "no";
      variant = "nodeadkeys";
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  security.polkit.enable = true;

  console.keyMap = "no";

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  programs = {
    dconf.enable = true;
    hyprland.enable = true;
    zsh.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  users.users.southcity = {
    isNormalUser = true;
    description = "southcity";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      southcity = import ../../users/southcity/home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    firefox
    pciutils
  ];

  system.stateVersion = "23.11";
}
