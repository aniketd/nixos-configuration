# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
      ../base/boot.nix
      ../base/network.nix
      ../base/pkgs.nix
      ../base/x.nix
      # Define a user account. Don't forget to set a password with ‘passwd’.
      ../base/users.nix
    ];

  nixpkgs.config.allowUnfree = true;
  boot.kernelModules = [ "applesmc" ];

  networking.hostName = "aniketd-nixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable pulseaudio for Firefox
  hardware.pulseaudio.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
