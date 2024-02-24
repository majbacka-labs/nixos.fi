
# 🌐 nixos.fi

NixOS netboot server configurations using the `nixie` module from our Nixie project.

## 📋 Overview

| Hostname | Architecture | Format       | Users | Address | Details |
| :---:     |  :---:         | :---:          | :---:   | :---: | :--- |
| [pxe-persistent-alpha](https://github.com/ponkila/homestaking-infra/tree/jesse/pxe-server/nixosConfigurations/pxe-persistent-alpha/default.nix) | x86_64-linux | persistent | core | private | + cache and remote builder |
| [launchpad](./nixosConfigurations/launchpad/default.nix) | x86_64-linux | kexecTree | [core](./nixosConfigurations/core.nix) | [launchpad.nixos.fi](http://launchpad.nixos.fi/unknown) | Hetzner VPS |
| ~~nix-pxe~~ | ~~x86_64-linux~~ | ~~kexecTree~~ | ~~core~~ | ~~nix-pxe.nixos.fi~~ | Public Instance (**TODO**) |

These servers, as part of the Nixie project, offer iPXE menus and netboot images with pre-determined contents. The project simplifies the process of setting up and managing network-based boot environments, enabling the booting of NixOS configurations from so-called 'flakes'. Stored in Git, these flakes provide a way to declare and manage NixOS configurations in a reproducible and modular manner.

## 🔍 Project Scope

The Nixie project, inclusive of the `nixie` module, allows users to customize an array of menu entries. These entries define the contents of each menu, shaping the netboot experience.

<details>

<summary> nixie.file-server.menus = [ ... ]; </summary>
  &nbsp;

  ```nix
  [
    {
      name = "tupakkatapa-lan";
      flakeUrl = "github:tupakkatapa/nix-config";
      hosts = ["bandit" "valdof"];
      buildRequests = true;
      timeout = 10;
    }
    {
      name = "jhvst-laptop";
      flakeUrl = "github:jhvst/nix-config";
      hosts = ["starlabs"];
      timeout = 5;
    }
  ];
  ```

</details>

The project's scope extends beyond just menu creation. It undertakes the generation of iPXE menus from the specified entries, compiles the hosts, and arranges for their remote delivery through HTTP(s) file servers. Utilizing this module, users can effortlessly configure a personalized version akin to `netboot.xyz`.

Setting up a booting environment locally via DHCP/TFTP is also a relatively straightforward process. It supports the setup of multiple subnets, allowing users to select network interfaces for the subnet. Furthermore, users can create and assign specific menus to be served to particular clients identified by their MAC addresses, in addition to the 'default' netboot menu. These reserved clients can also be allocated static IPv4 addresses.

<details>

<summary> nixie.dhcp.subnets.*.clients = [ ... ]; </summary>
  &nbsp;

  ```nix
  [
    {
      menu = "tupakkatapa-lan";
      mac = "b1:a0:42:64:aa:5c";
    }
    {
      menu = "jhvst-laptop";
      mac = "a3:f4:e9:a6:c0:3f";
      address = "192.168.1.127";
    }
  ];
  ```

</details>

The project is an ideal solution for managing a large local network of ephemeral machines, such as Ethereum infrastructure. The project supports the initrd + kernel format for the hosts, which can be seamlessly integrated with a NixOS configuration through a format module. We are working on more flexible menu creation, which would not necessarily require the clients to be NixOS configurations.

### Features

- **🔒 Automatic HTTPS**

  The server will automatically attempt to set up HTTPS to serve the iPXE menus and netboot images remotely if a domain name is provided. The user only needs to handle configuring the DNS records and firewall settings.

- **🏗️ Build requests**

  If enabled, instead of pre-compiling hosts post-boot, the server compiles hosts upon client request, ensuring they are always up-to-date with upstream changes. A future goal is to enable the server to compile custom kernels based on client hardware data.

- **🔀 Multiple interfaces**

  As stated before, the user can configure multiple different subnets and define the network interfaces that should be bridged together and assigned to the subnet. Of course, this requires multiple network interfaces to be available to the host. This allows the server to be used in a similar manner to a router, which might be where this project is headed, or at least be a part of it, in the distant future.

