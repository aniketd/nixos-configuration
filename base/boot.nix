{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
      };
      grub = {
        fsIdentifier = "label";
        memtest86.enable = true;
        useOSProber = true;                   # Detect other OS's, if installed in other partitions.
      };
    };
  };
}
