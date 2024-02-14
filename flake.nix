{
  inputs = {
    nixobolus.url = "github:ponkila/nixobolus";
    nix-pxe.url = "git+ssh://git@github.com/majbacka-labs/Nix-PXE";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {
    self,
    nix-pxe,
    nixobolus,
    nixpkgs,
    ...
  }: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  in {
    # Custom entrypoint aliases
    packages = forAllSystems (system: with self.nixosConfigurations; {
      "launchpad" = launchpad.config.system.build.kexecTree;
    });

    # NixOS configuration entrypoints
    nixosConfigurations = {
      # https://github.com/ponkila/homestaking-infra
      launchpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixosConfigurations/launchpad/default.nix
          ./nixosConfigurations/core.nix
          nixobolus.nixosModules.kexecTree
          nix-pxe.nixosModules.pxe-serve
        ];
      };
    };
  };
}

