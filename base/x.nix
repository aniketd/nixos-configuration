{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    synaptics = {
      enable = true;
      twoFingerScroll = true;
    };
    # displayManager.lightdm.enable = true;
    # windowManager = {
    #   default = "Xmonad";
    #   xmonad.enable = true;
    # };
    # desktopManager = {
    #   default = "none";
    #   xterm.enable = false;
    # };
  };

  services.compton = {
    enable = true;
    fade = true;
    inactiveOpacity = "0.9";
    shadow = true;
    fadeDelta = 4;
  };
}
