{ pkgs, ... }:

{
  imports =
    [ 
      ../../bundles/nixos/common
      ../../bundles/nixos/peripherals
      ../../modules/nixos/steam
      ../../modules/nixos/nvidia
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "neptr";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Users
  users.defaultUserShell = pkgs.zsh;

  users.users.southcity = {
    isNormalUser = true;
    description = "southcity";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs = {
    dconf.enable = true;
    firefox.enable = true;
    zsh.enable = true;
  };
  
  system.stateVersion = "24.05";
}
