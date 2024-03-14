# Productization of Nixie

This document outlines the current and hypothetical user experiences (UX) when starting to manage infrastucture with Nixie. The purpose of this document is to expand understanding and raise interest in the potential capabilities and applications of this project.

Both will have the same initial step: use declarative operating systems which can produce boot images consisting of initial ramdisk and kernel files, preferably NixOS. While Nixie can only run on NixOS, it can boot other operating systems, but it only makes sense to use declarative ones. If you already use NixOS, it is extremely easy to switch the output format to boot images, thanks to our additional modules. There is a problem with the size of this step, but transforming your existing infrastructure parts to be reproductable is a necessary move to to this approach of infrastructure management.

Warning: you will have to learn some Nix, find someone who has, or use existing tools to create the configurations.

## Current

This is the current workflow for starting to manage infrastructure with Nixie v0.2.2.

Now that we have something to boot, we need to set up a netboot server to boot from. As stated before, this must be NixOS-based, since Nixie is a NixOS module and does not support any other operating system. Nixie has its own guide for configuring and setting it up, so I will not go into too much depth here. Briefly, you will need to set up a NixOS host with an imported Nixie module, then within, configure each iPXE menu to be served and if you wish, DHCP section for local serving, and then just deploy the machine via any method.

Should be noted that the current setup is only possible if you have access to the source code.

## After

The hypothetical user experience (UX) after productization.

To interact with the product, users could:

  1. Create a user account on nixos.fi.
  2. Add a flake URL containing the hosts they wish to make bootable via an iPXE menu on nixos.fi (limited to a number of URLs or hosts).
  3. Await the completion of various tests and builds.
  4. Boot manually from the iPXE shell or through downloadable iPXE binaries.

### Paid Features

The following are suggestions for premium features that enhance the usability and functionality of the product, intended to finance project development:

- Access to unlimited and more configurable menus via nixos.fi.
- Rights to host own Nixie instance, which also provides way for network booting locally.


