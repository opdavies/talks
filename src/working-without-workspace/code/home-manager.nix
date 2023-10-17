{ config, pkgs, ... }:

{
  home.username = "opdavies";
  home.homeDirectory = "/home/opdavies";

  home.packages = with pkgs; [
    php82
    php82Packages.composer
  ];
};
