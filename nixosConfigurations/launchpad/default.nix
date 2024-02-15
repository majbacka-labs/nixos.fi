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
    dataDir = "/var/www/netboot";

    # This binds tmpfs to a persistent BTRFS subvolume
    # Necessary since the server is running entirely on RAM
    btrfsTmp = {
      enable = true;
      label = "nixos";
      subvolid = 256;
    };

    file-server = {
      # Hit the ACME rate limit; will replace with a domain name soon
      defaultAddress = "37.27.43.221";
      #defaultAddress = "launchpad.nixos.fi";

      # Not recommended, but currently, we have to build netboot images elsewhere
      # due to hardware limitations. They are then transferred to the server manually
      compile = false;

      # Each of these objects in this array represents one iPXE menu
      menus = [
        {
          # https://github.com/ponkila/homestaking-infra
          name = "homestaking";
          flakeUrl = "github:ponkila/homestaking-infra";
        }
        # {
        #   # https://github.com/tupakkatapa/nix-config
        #   name = "https-test";
        #   flakeUrl = "github:tupakkatapa/nix-config";
        #   hosts = ["bandit"];
        #   buildRequests = true;
        #   timeout = 30;
        # }
      ];
    };
  };

  # Persistent ACME directory for TLS/SSL certificates
  fileSystems."/var/lib/acme" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "btrfs";
    options = ["subvolid=257"];
  };

  system.stateVersion = "23.11";
}

