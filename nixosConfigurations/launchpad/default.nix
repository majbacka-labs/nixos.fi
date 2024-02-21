{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # Set a hostname and domain of your choice
  networking = {
    hostName = "launchpad";
    domain = "nixos.fi";
  };

  # Main module configuration
  nixie = {
    enable = true;

    # This binds tmpfs to a persistent BTRFS subvolume
    # Necessary since the server is running entirely on RAM
    btrfsTmp = {
      enable = true;
      label = "nixos";
      subvolid = 256;
    };

    file-server = {
      # This enabled HTTPS automatically since it is a domain name
      defaultAddress = "launchpad.nixos.fi";

      # Not recommended, but currently, we have to build netboot images elsewhere
      # due to hardware limitations. They are then transferred to the server manually
      compile = false;

      # Each of these objects in this array represents one iPXE menu
      menus = [
        {
          # https://github.com/ponkila/homestaking-infra
          name = "dinar-tweaks";
          flakeUrl = "github:ponkila/homestaking-infra?ref=dinar-tweaks";
          hosts = ["dinar-ephemeral-alpha"];
        }
        {
          # https://github.com/ponkila/homestaking-infra
          name = "homestaking-infra";
          flakeUrl = "github:ponkila/homestaking-infra";
          hosts = ["ponkila-ephemeral-beta"];
        }
        {
          # https://github.com/tupakkatapa/nix-config
          name = "https-test";
          flakeUrl = "github:tupakkatapa/nix-config";
          hosts = ["bandit"];
          #buildRequests = true;
        }
      ];
    };
  };

  # Persistent directories, necessary since the server is running entirely on RAM
  fileSystems = {
    "/var/lib/acme" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
      options = ["subvolid=257"];
    };
    "/var/www/netboot" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
      options = ["subvolid=258"];
    };
  };

  system.stateVersion = "23.11";
}

