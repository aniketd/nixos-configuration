{ config, pkgs, ... }:

{
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  # wpa_supplicant is incompatible with networkmanager.
  networking.networkmanager.enable = true;
}
