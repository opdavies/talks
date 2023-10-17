{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "i8042.reset" ];
  boot.extraModulePackages = [ ];


  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7c6d69ec-ba06-4ddb-b9c4-62b3994fda91";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/B729-9A75";
    fsType = "vfat";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/5db0a0e6-93fb-4d0b-8fb0-fdb3cb76b89d"; }];
