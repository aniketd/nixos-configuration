# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # bare-bones
    st
    fish
    tmux
    pass
    ripgrep
    dunst
    i3lock
    feh
    scrot
    xclip
    wget
    curl
    neovim
    gitAndTools.gitFull
    networkmanagerapplet

    # fleshing-out
    fantasque-sans-mono
    keybase-gui
    emacs
    inotify-tools
    firefox
    cmus
    libvirt
    chromium

    # dev-env
    stack                   # Haskell Stack
    rustup                  # Rust tool-belt
    elixir                  # Elixir on Erlang
    yarn                    # NPM alternative for the nodejs ecosystem
  ];

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
