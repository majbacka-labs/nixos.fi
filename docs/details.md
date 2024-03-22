
# Details of Nixie

The Nixie project, inclusive of the `nixie` module, enables users to tailor an array of menu entries. These entries determine the contents of each menu, defining the netboot experience.

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

The project's scope goes beyond simply creating menus. It facilitates the generation of iPXE menus from the provided entries, compiles the hosts, and manages their remote delivery via HTTP(s) file servers. Utilizing this module, users can effortlessly set up a personalized version akin to `netboot.xyz`.

Configuring a local booting environment through DHCP/TFTP is also relatively straightforward. It supports the configuration of multiple subnets, allowing for the selection of network interfaces for each subnet. Moreover, users can create and assign specific menus to be served to particular clients identified by their MAC addresses, in addition to the 'default' netboot menu. These reserved clients can be allocated static IPv4 addresses as well.

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

The project is an ideal solution for managing a large local network of ephemeral machines, such as an Ethereum infrastructure. It supports the initrd + kernel format for the hosts, which can be seamlessly integrated with a NixOS configuration through a format module. While it is possible to boot non-NixOS hosts, this approach does not fully capitalize on the project's potential.

## Features

- **🔒 Automatic HTTPS**

  The server will automatically attempt to set up HTTPS to serve the iPXE menus and netboot images remotely if a domain name is provided. Users only need to manage configuring the DNS records and firewall settings.

- **🏗️ Build requests**

  If enabled, instead of pre-compiling hosts, the server compiles hosts upon client request, ensuring they are always up-to-date with upstream changes. A future goal is to enable the server to compile custom kernels based on client hardware data.

- **🔀 Multiple interfaces**

  Users can configure multiple subnets and define the network interfaces to be bridged and assigned to each subnet. This feature requires multiple network interfaces to be available to the host, allowing the server to function similarly to a router. This capability might hint at where the project is heading, potentially becoming a part of it in the distant future.

