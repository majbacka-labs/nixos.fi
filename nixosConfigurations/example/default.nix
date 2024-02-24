{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # Set a hostname and domain of your choice
  networking = {
    hostName = "example";
    domain = "nixos.fi";
  };

  # Main module configuration
  nixie = {
    enable = true;

    file-server = {
      # This enabled HTTPS automatically since it is a domain name
      defaultAddress = "example.nixos.fi";

      # Each of these objects in this array represents one iPXE menu
      menus = [
        {
          # https://github.com/tupakkatapa/nix-config
          name = "minimal";
          flakeUrl = "github:tupakkatapa/nix-config";
          hosts = ["bandit"];
          buildRequests = true;
        }
      ];
    };
  };

  system.stateVersion = "23.11";
}

