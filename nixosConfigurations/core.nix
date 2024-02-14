{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # Autologin
  services.getty.autologinUser = "core";

  # Enable SSH
  services.openssh.enable = true;

  # User config
  users.users.core = {
    isNormalUser = true;
    group = "core";
    extraGroups = [
      "audio"
      "users"
      "video"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKEdpdbTOz0h9tVvkn13k1e8X7MnctH3zHRFmYWTbz9T kari@torque"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJdbU8l66hVUAqk900GmEme5uhWcs05JMUQv2eD0j7MI juuso@starlabs"
    ];
    shell = pkgs.fish;
  };
  users.groups.core = {};
  environment.shells = [pkgs.fish];
  programs.fish.enable = true;

  # Install some packages
  environment.systemPackages = with pkgs; [
    btrfs-progs
    kexec-tools
    git
    nix
    rsync
    vim
    tmux
  ];

  # Allow passwordless sudo from wheel group
  security.sudo = {
    enable = true;
    wheelNeedsPassword = lib.mkForce false;
    execWheelOnly = true;
  };
}

