{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixedo";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  users.users.opdavies = {
    isNormalUser = true;
    description = "Oliver Davies";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    packages = with pkgs; [ firefox ];
  };
