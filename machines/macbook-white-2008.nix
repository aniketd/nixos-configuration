# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelModules = [ "applesmc" ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    st
    dunst
    i3lock
    feh
    scrot
    fish
    tmux
    ripgrep
    xclip
    wget
    curl
    neovim
    emacs
    pass
    inotify-tools
    gitAndTools.gitFull
    firefox
    fantasque-sans-mono
    networkmanagerapplet
    cmus
    libvirt
    stack # Haskell Stack
    yarn
    chromium
    keybase-gui
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.synaptics.enable = true;
  services.xserver.synaptics.twoFingerScroll = true;
  services.compton = {
    enable = true;
    fade = true;
    inactiveOpacity = "0.9";
    shadow = true;
    fadeDelta = 4;
  };

  #---services.xserver = {
  #---  enable = true;
  #---  layout = "us";
  #---  xkbOptions = "eurosign:e";
  #---  synaptics = {
  #---    enable = true;
  #---    twoFingerScroll = true;
  #---  };
  #---  # desktopManager.xfce.enable = true;
  #---  windowManager.xmonad.enable = true;
  #---  windowManager.default = "xmonad";
  #---  desktopManager.xterm.enable = false;
  #---  desktopManager.default = "none";

  #---  displayManager = {
  #---    slim = {
  #---      enable = true;
  #---    };
  #---  };
  #---  # wacom.enable = true;
  #---};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.fish.enable = true;
  users.extraUsers.aniketd = {
    shell = "/run/current-system/sw/bin/fish";
    isNormalUser = true;
    uid = 1000;
    home = "/home/aniketd";
    description = "Aniket Deshpande";
    extraGroups = [ "wheel" "networkmanager" "disk" "vboxusers" "cdrom" ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
