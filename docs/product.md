
# Productization of Nixie

This document outlines the current and hypothetical user experiences (UX) when beginning to manage infrastructure with Nixie. The purpose of this document is to expand understanding and generate interest in the potential capabilities and applications of this project.

Both scenarios start with the same initial step: using declarative operating systems capable of producing boot images consisting of initial ramdisk and kernel files, preferably NixOS. While Nixie can only run on NixOS, it can boot other operating systems. However, it makes the most sense to use declarative ones. For those already using NixOS, switching the output format to boot images is made significantly easier with our additional modules. A challenge at this step is transforming your existing infrastructure to be reproducible, a necessary move towards this approach to infrastructure management.

Warning: Engaging with this process requires some knowledge of Nix, finding someone skilled in it, or utilizing existing tools for creating configurations.

## Current

This is the current workflow for starting to manage infrastructure with Nixie v0.2.2.

With bootable content ready, the next step is setting up a netboot server. As mentioned, this server must be NixOS-based since Nixie is a NixOS module and does not support other operating systems. Nixie provides its guide for configuring and setting it up, which I won't detail here. In brief, you'll need a NixOS host with the Nixie module imported. Within that, configure each iPXE menu to be served, and if desired, set up a DHCP section for local service, then deploy the machine via any method.

It should be noted that the current setup is possible only if you have access to the source code.

## Product

The hypothetical user experience (UX) after productization:

### 1. GitHub

  1. Submit a pull request to this repository following the guidelines, including a menu entry for your NixOS configurations.
  2. Await automatic tests, review/merge by a maintainer, and server update.
  3. Boot manually from the iPXE shell or compile iPXE binaries with our free tool.

### 2. Website

  1. Create a user account on nixos.fi.
  2. Add a flake URL containing the hosts you wish to make bootable via an iPXE menu on nixos.fi (limited to a number of URLs or hosts).
  3. Wait for the completion of various tests and builds.
  4. Boot manually from the iPXE shell or through downloadable iPXE binaries.

### 3. Router

  1. Install or acquire a Nixie router.
  2. Set up the router traditionally via a web interface.
  3. Ensure setup of a remote builder/cache or verify the hardware is sufficient to build your hosts.
  4. Add a flake URL containing the hosts you wish to make bootable via the router's DHCP/TFTP.
  5. Boot a host on your network.

  Note: This method can also be used remotely, similar to the website concept.

### Paid Features

Suggestions for premium features to enhance usability and functionality, financing project development:

- Access to unlimited and more configurable menus via nixos.fi.
- Rights to host your own Nixie instance, providing a means for local network booting.

## Potential Integrations

- [etcd](https://etcd.io/), a distributed reliable key-value store.
- [rEFInd](http://www.rodsbooks.com/refind/), a boot manager for EFI and UEFI systems.
- [eBPF](https://ebpf.io/what-is-ebpf/), a Linux kernel technology for network and performance monitoring.

