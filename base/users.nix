{ config, pkgs, ... }:

{
  users.extraUsers = {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    aniketd = {
      shell = "/run/current-system/sw/bin/fish";
      isNormalUser = true;
      uid = 1000;
      home = "/home/aniketd";
      description = "Aniket Deshpande";
      extraGroups = [ "wheel" "networkmanager" "disk" "vboxusers" "cdrom" ];
    };
  };
  programs.fish.enable = true;
}
