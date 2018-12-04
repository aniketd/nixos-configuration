{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    haskellPackages.xmonad
    haskellPackages.xmobar
    xfontsel
    xlsfonts
  ];

  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    #libinput.enable = true; # Either this or synaptics
    synaptics = {
      enable = true;
      twoFingerScroll = true;
    };
    displayManager.lightdm.enable = true;
    windowManager = {
      default = "xmonad";
      xmonad = {
        enable = true;
	enableContribAndExtras = true;
      };
    };
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
  };

  programs.ssh.startAgent = true;

  services.compton = {
    enable = true;
    fade = true;
    inactiveOpacity = "0.9";
    shadow = true;
    fadeDelta = 4;
  };
}
