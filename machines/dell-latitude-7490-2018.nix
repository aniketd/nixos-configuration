# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
      # Include base system configuration.
      ../base/boot.nix
      ../base/network.nix
      ../base/pkgs.nix
      ../base/x.nix
      # Define a user account. Don't forget to set a password with ‘passwd’.
      ../base/users.nix
    ];

  nixpkgs.config.allowUnfree = true;

  # Define your hostname.
  networking.hostName = "aaum";

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true; # Cannot use with gnupg with SSH support

  # Enable the KDE Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you 
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
}
