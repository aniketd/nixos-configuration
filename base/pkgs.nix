# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    st
    fish
    tmux
    ripgrep
    dunst
    i3lock
    feh
    scrot
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

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
