# Infra-PXE

NixOS netboot server configurations using the `pxe-serve` module from our Nix-PXE project.

# Netboot Servers

| Hostname | Architecture | Format       | Users | Details
| :-:      |  :-:         | :-:          | :-:   | :-
[launchpad](./nixosConfigurations/launchpad/default.nix) | x86_64 | kexecTree | core | Hetzner VPS
